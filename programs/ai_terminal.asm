; ai_terminal.asm -- AI Chat Terminal for Geometry OS
;
; Connects to cloud AI (ZAI) via LLM opcode (0x9C).
; Type a message, press Enter to send. Response appears below.
; Conversation history is maintained for context.
; /run assembles the last AI response. /yes confirms and executes it.
; AI-written bytecode runs in a sandboxed child process (SPAWNC with
; capability restrictions). The child has memory isolation via COW
; page tables and VFS access limited to /tmp/* (read+write) and
; /lib/* (read only). If SPAWNC fails, falls back to RUNNEXT (legacy).
; Commands: /clear /help /sys /run /yes /focus /status /debug
;
; RAM Layout:
;   0x4000-0x44EB  Text buffer (42*30 = 1260 u32 cells, row-major)
;   0x4800         Cursor column
;   0x4801         Cursor row
;   0x4802         Blink counter
;   0x5000-0x50FF  Scratch line buffer (256 chars + null)
;   0x5400-0x63FF  LLM prompt buffer (4K)
;   0x6400-0x73FF  LLM response buffer (4K)
;   0x7400-0x74FF  Conversation history (last response only, for context)
;   0x7500-0x7509  Sandbox capability list (for SPAWNC)
;   0x7600-0x762F  Sandbox pattern strings ("/tmp/*", "/lib/*")
;
; Registers:
;   r0: CMP result (reserved)
;   r1: Constant 1 (must reload after ops that clobber)
;   r5: Key input
;   r30: Stack pointer (SP)

#define COLS 42
#define ROWS 30
#define BUF 0x4000
#define BUF_END 0x44EC
#define CUR_COL 0x4800
#define CUR_ROW 0x4801
#define BLINK 0x4802
#define SCRATCH 0x5000
#define PROMPT_BUF 0x5400
#define RESP_BUF 0x6400
#define HISTORY 0x7400
#define ASM_STATUS 0xFFD
#define RUN_PENDING 0x7830   ; Nonzero = compiled bytecode waiting for /yes
#define CHILD_PID     0x7843   ; PID of last spawned child (set by cmd_yes)
#define RECOVERY_MODE 0x7844   ; 1 = auto-execute LLM response without /yes
#define LAST_HEARTBEAT 0x7840
#define WATCHDOG_TIMER 0x7841
#define WATCHDOG_STRIKES 0x7842
#define SANDBOX_CAPS 0x7500  ; Sandbox capability list for SPAWNC
#define SANDBOX_STRS 0x7600  ; Pattern strings for sandbox capabilities
#define CMD_HIST_BASE 0x7700 ; Command history ring buffer (8 entries x 42 chars)
#define CMD_HIST_COUNT 0x78F0 ; Number of history entries stored
#define CMD_HIST_NAV 0x78F1  ; Current recall index for up/down arrow navigation
#define CTX_TURNS 0x78F2     ; Conversation turn counter
#define CTX_CHARS 0x78F3     ; Total chars in conversation (prompt + response)
#define DEBUG_MAGIC      0x0C00  ; Page 3 debug mailbox
#define DEBUG_PARENT_PID 0x0C01
#define DEBUG_CHILD_PID  0x0C02
#define DEBUG_COMMAND    0x0C03
#define DEBUG_STATUS     0x0C04
#define DEBUG_RESPONSE   0x0C05
#define DEBUG_HEARTBEAT   0x0C27
#define DEBUG_CHECKPOINT 0x0C28

; =========================================
; INIT
; =========================================
LDI r1, 1
LDI r30, 0xFD00   ; Stack pointer

; Request asm_dev system prompt for every LLM call from this app.
; RAM[0x7820] = 1 tells build_llm_system_prompt() to send the GeoOS
; assembly-programmer prompt instead of the Oracle world-guide prompt.
LDI r20, 0x7820
LDI r0, 1
STORE r20, r0

; Clear screen
LDI r0, 0x0A0A14
FILL r0

; Clear text buffer to spaces
LDI r20, BUF
LDI r6, 32
clear_buf_init:
    STORE r20, r6
    ADD r20, r1
    CMPI r20, BUF_END
    BLT r0, clear_buf_init

; Init cursor and blink
LDI r20, CUR_COL
LDI r0, 0
STORE r20, r0
LDI r20, CUR_ROW
STORE r20, r0
LDI r20, BLINK
STORE r20, r0

; Clear prompt/response/history buffers
LDI r12, PROMPT_BUF
LDI r16, 4096
CALL clear_buf
LDI r12, RESP_BUF
LDI r16, 4096
CALL clear_buf
LDI r12, HISTORY
LDI r16, 256
CALL clear_buf

; Clear command history ring buffer (8 entries x 42 chars = 336 words)
LDI r12, CMD_HIST_BASE
LDI r16, 336
CALL clear_buf

; Init history metadata
LDI r20, CMD_HIST_COUNT
LDI r0, 0
STORE r20, r0
LDI r20, CMD_HIST_NAV
STORE r20, r0

; Init context tracking
LDI r20, CTX_TURNS
STORE r20, r0
LDI r20, CTX_CHARS
STORE r20, r0

; Title bar
LDI r1, 0
LDI r2, 0
LDI r3, 256
LDI r4, 16
LDI r5, 0x1A0033
RECTF r1, r2, r3, r4, r5

; Title text "AI Terminal - ZAI"
LDI r20, SCRATCH
STRO r20, "AI Terminal - ZAI"
LDI r1, 4
LDI r2, 4
LDI r3, SCRATCH
LDI r4, 0x00FF00  ; green
LDI r5, 0x1A0033  ; match title bar
DRAWTEXT r1, r2, r3, r4, r5

; Status indicator dot (green = connected)
LDI r1, 230
LDI r2, 4
LDI r3, 8
LDI r4, 8
LDI r5, 0x00FF00
RECTF r1, r2, r3, r4, r5

; Close button hit region
LDI r1, 220
LDI r2, 0
LDI r3, 36
LDI r4, 16
HITSET r1, r2, r3, r4, 99

LDI r1, 1

; Write prompt "> " at buffer row 0
LDI r20, BUF
LDI r0, 62           ; '>'
STORE r20, r0
ADD r20, r1
LDI r0, 32           ; ' '
STORE r20, r0

; Set cursor to col 2
LDI r20, CUR_COL
LDI r0, 2
STORE r20, r0

; Init watchdog
LDI r20, WATCHDOG_TIMER
LDI r0, 60
STORE r20, r0
LDI r20, WATCHDOG_STRIKES
LDI r0, 0
STORE r20, r0

; Welcome message
LDI r20, SCRATCH
STRO r20, "AI Terminal v1.0"
CALL write_line_to_buf
LDI r1, 1
LDI r20, SCRATCH
STRO r20, "Type a message, Enter to send"
CALL write_line_to_buf
LDI r1, 1
LDI r20, SCRATCH
STRO r20, "/help for commands"
CALL write_line_to_buf
LDI r1, 1

; Write prompt on new line
CALL write_prompt

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r1, 1

    ; Watchdog
    CALL check_watchdog

    ; Blink counter
    LDI r20, BLINK
    LOAD r0, r20
    ADD r0, r1
    STORE r20, r0

    ; Render
    CALL render

    FRAME

    ; Read key
    IKEY r5
    JZ r5, main_loop

    ; Handle key
    CALL handle_key
    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r1, 1

    ; Clear content area
    LDI r1, 0
    LDI r2, 16
    LDI r3, 256
    LDI r4, 240
    LDI r5, 0x0A0A14
    RECTF r1, r2, r3, r4, r5

    ; Redraw title bar with context info
    PUSH r31
    CALL render_title
    POP r31

    ; Row loop
    LDI r1, 1
    LDI r8, 8            ; CHAR_H
    LDI r9, 6            ; CHAR_W
    LDI r10, 0           ; row counter
    LDI r11, BUF         ; buffer pointer
    LDI r12, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to scratch
    LDI r16, SCRATCH
    LDI r17, 0
copy_col:
    LOAD r6, r11
    STORE r16, r6
    ADD r11, r1
    ADD r16, r1
    ADD r17, r1
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r0, 0
    STORE r16, r0

    ; Color based on content
    LDI r14, 0xCCCCCC  ; default light gray

    ; Check if row starts with '>' (user prompt) -> green
    LDI r16, SCRATCH
    LOAD r6, r16
    CMPI r6, 62         ; '>'
    JNZ r0, check_ai_prefix
    LDI r14, 0x44FF44  ; green for user input
    JMP render_text

check_ai_prefix:
    ; Check if row starts with 'A' + 'I' + ':' (AI response) -> cyan
    LDI r16, SCRATCH
    LOAD r6, r16
    CMPI r6, 65         ; 'A'
    JNZ r0, render_text_default
    ADD r16, r1
    LOAD r6, r16
    CMPI r6, 73         ; 'I'
    JNZ r0, render_text_default
    ADD r16, r1
    LOAD r6, r16
    CMPI r6, 58         ; ':'
    JNZ r0, render_text_default
    LDI r14, 0x00FFFF  ; cyan for AI response
    JMP render_text

render_text_default:
    ; Check for '/' commands -> yellow
    LDI r16, SCRATCH
    LOAD r6, r16
    CMPI r6, 47         ; '/'
    JNZ r0, render_text
    LDI r14, 0xFFFF44  ; yellow for commands

render_text:
    ; DRAWTEXT x=0, y=r12, addr=SCRATCH, fg=r14, bg=0 (transparent)
    LDI r1, 0
    LDI r13, SCRATCH
    LDI r15, 0         ; bg = transparent
    DRAWTEXT r1, r12, r13, r14, r15

    LDI r1, 1

    ADD r12, r8          ; y += 8
    ADD r10, r1          ; row++
    CMPI r10, ROWS
    BLT r10, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r0, r20
    LDI r7, 8
    AND r0, r7
    CMPI r0, 4
    BLT r0, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r0, r20
    MUL r0, r9           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r2, r20
    MUL r2, r8           ; row * 8
    LDI r3, 16
    ADD r2, r3           ; y = 16 + row*8
    LDI r3, 6
    LDI r4, 8
    LDI r5, 0x44FF44
    RECTF r0, r2, r3, r4, r5

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r5 = key
; =========================================
handle_key:
    PUSH r31
    LDI r1, 1

    CMPI r5, 13
    JNZ r0, check_bs
    JMP do_enter

check_bs:
    CMPI r5, 8
    JNZ r0, check_del
    JMP do_backspace

check_del:
    CMPI r5, 127
    JNZ r0, check_up_arrow
    JMP do_backspace

check_up_arrow:
    CMPI r5, 128         ; Up arrow = 0x80
    JNZ r0, check_down_arrow
    JMP do_history_up

check_down_arrow:
    CMPI r5, 129         ; Down arrow = 0x81
    JNZ r0, do_char
    JMP do_history_down

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r2, r20
    LDI r3, COLS
    MUL r2, r3           ; r2 = row * COLS
    LDI r20, CUR_COL
    LOAD r0, r20
    ADD r2, r0           ; r2 = row*COLS + col
    LDI r20, BUF
    ADD r20, r2          ; r20 = BUF + offset
    STORE r20, r5        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r0, r20
    ADD r0, r1
    STORE r20, r0

    ; If col >= COLS, wrap
    CMPI r0, COLS
    JNZ r0, hk_ret
    CALL do_newline
    JMP hk_ret

; =========================================
; DO_ENTER -- send to LLM or handle command
; =========================================
do_enter:
    ; 1. Extract command text from current row into SCRATCH
    CALL extract_cmd

    ; 2. Save command to history ring buffer
    PUSH r31
    CALL history_save
    POP r31

    ; 3. Advance to next row
    CALL do_newline

    ; 3. Check for / commands
    LDI r1, 1
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 47         ; '/'
    JNZ r0, send_to_llm  ; not a command, send to LLM

    ; Check /help
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r0, try_clear_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_clear_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r0, try_clear_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r0, try_clear_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, send_to_llm
    JMP cmd_help

try_clear_cmd:
    ; Check /clear
    LDI r20, SCRATCH
    ADD r20, r1           ; skip '/'
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r0, try_sys_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r0, try_sys_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_sys_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r0, try_sys_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r0, try_sys_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, send_to_llm
    JMP cmd_clear

try_sys_cmd:
    ; Check /sys
    LDI r20, SCRATCH
    ADD r20, r1           ; skip '/'
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r0, try_run_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 121        ; 'y'
    JNZ r0, try_run_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r0, try_run_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_run_cmd
    JMP cmd_sys

try_run_cmd:
    ; Check /run
    LDI r20, SCRATCH
    ADD r20, r1           ; skip '/'
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r0, try_yes_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r0, try_yes_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 110        ; 'n'
    JNZ r0, try_yes_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_yes_cmd
    JMP cmd_run

try_yes_cmd:
    ; Check /yes -- confirms a pending /run
    LDI r20, SCRATCH
    ADD r20, r1           ; skip '/'
    LOAD r22, r20
    CMPI r22, 121        ; 'y'
    JNZ r0, try_focus_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_focus_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r0, try_focus_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_focus_cmd
    JMP cmd_yes

try_focus_cmd:
    ; Check /focus -- set focus opcode for targeted LLM diagnostics
    LDI r20, SCRATCH
    ADD r20, r1           ; skip '/'
    LOAD r22, r20
    CMPI r22, 102        ; 'f'
    JNZ r0, try_status_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r0, try_status_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r0, try_status_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r0, try_status_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r0, try_status_cmd
    JMP cmd_focus

try_status_cmd:
    ; Check /status -- show current focus opcode and last assemble result
    LDI r20, SCRATCH
    ADD r20, r1           ; skip '/'
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r0, try_debug_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r0, try_debug_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r0, try_debug_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r0, try_debug_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r0, try_debug_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r0, try_debug_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_debug_cmd
    JMP cmd_status

; =========================================
; SEND_TO_LLM
; Build prompt from user input + history, call LLM, display response
; =========================================
; ── /debug command dispatch ──
try_debug_cmd:
    LDI r20, SCRATCH
    ADD r20, r1           ; skip '/'
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r0, send_to_llm
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, send_to_llm
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 98         ; 'b'
    JNZ r0, send_to_llm
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r0, send_to_llm
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 103        ; 'g'
    JNZ r0, send_to_llm
    JMP cmd_debug

send_to_llm:
    LDI r1, 1
    ; Cancel any pending /run -- a new chat turn supersedes prior output.
    LDI r20, RUN_PENDING
    LDI r0, 0
    STORE r20, r0

    ; Increment conversation turn counter
    LDI r20, CTX_TURNS
    LOAD r0, r20
    ADD r0, r1
    STORE r20, r0

    ; Show "Thinking..." status
    LDI r20, SCRATCH
    STRO r20, "Thinking..."
    CALL write_line_to_buf

    ; Build prompt at PROMPT_BUF:
    ; "You are a helpful AI inside Geometry OS, a pixel-based OS.\n\n"
    ; If history exists, append it as context
    ; Then append "User: <input>\nAI:"

    LDI r19, PROMPT_BUF

    ; System context
    STRO r19, "You are an AI assistant inside Geometry OS. Be concise. You help build programs and answer questions about the OS."
    CALL advance_to_null

    ; Append newline
    LDI r12, 10
    STORE r19, r12
    ADDI r19, 1
    STORE r19, r12
    ADDI r19, 1

    ; Check if we have conversation history
    LDI r12, HISTORY
    LOAD r13, r12
    LDI r14, 0
    CMP r13, r14
    JZ r0, skip_history

    ; Append history context
    STRO r19, "Previous: "
    CALL advance_to_null
    LDI r18, HISTORY
    CALL copy_until_null

    ; Append newline
    LDI r12, 10
    STORE r19, r12
    ADDI r19, 1

skip_history:
    ; Append "User: " + input from SCRATCH
    STRO r19, "User: "
    CALL advance_to_null
    LDI r18, SCRATCH
    CALL copy_until_null

    ; Append "\nAnswer briefly."
    LDI r12, 10
    STORE r19, r12
    ADDI r19, 1
    STRO r19, "Answer briefly."
    CALL advance_to_null
    LDI r12, 0
    STORE r19, r12

    ; Count prompt chars and add to CTX_CHARS
    LDI r20, PROMPT_BUF
    CALL strlen_prompt_buf
    ; r0 = prompt length
    LDI r20, CTX_CHARS
    LOAD r10, r20
    ADD r10, r0
    STORE r20, r10

    ; Call LLM: prompt at PROMPT_BUF, response at RESP_BUF, max 3840 chars
    LDI r3, PROMPT_BUF
    LDI r4, RESP_BUF
    LDI r5, 3840
    LLM r3, r4, r5

    ; r0 = response length -- add to CTX_CHARS
    LDI r20, CTX_CHARS
    LOAD r10, r20
    ADD r10, r0
    STORE r20, r10
    LDI r1, 1

    ; Write "AI: " prefix then response lines
    LDI r20, SCRATCH
    STRO r20, "AI: "
    ; Append first part of response
    LDI r21, RESP_BUF
    LDI r22, 0
    LDI r23, 38          ; max chars to append to first line (42 - 4)
append_first:
    LOAD r0, r21
    LDI r6, 0
    CMP r0, r6
    JZ r0, first_done
    LDI r6, 10
    CMP r0, r6
    JZ r0, first_done
    ADD r20, r1
    ADDI r22, 1
    STORE r20, r0
    ADD r21, r1
    CMPI r22, 38
    JNZ r0, append_first

first_done:
    LDI r0, 0
    ADD r20, r1
    STORE r20, r0

    CALL write_line_to_buf
    LDI r1, 1

    ; Write remaining response lines (word-wrap at COLS-2)
    LDI r25, 0           ; offset into response
    ; Skip chars already written in first line
    LDI r26, 0
skip_written:
    CMPI r26, 38
    BGE r0, write_remaining
    LOAD r0, r21
    LDI r6, 0
    CMP r0, r6
    JZ r0, llm_done
    ADD r21, r1
    ADDI r26, 1
    JMP skip_written

write_remaining:
    ; Check if there are more chars
    LOAD r0, r21
    LDI r6, 0
    CMP r0, r6
    JZ r0, llm_done

    ; Write COLS chars per line
    LDI r20, SCRATCH
    LDI r22, 0
wrap_loop:
    LOAD r0, r21
    LDI r6, 0
    CMP r0, r6
    JZ r0, wrap_line_done
    LDI r6, 10
    CMP r0, r6
    JNZ r0, wrap_no_newline
    ; Skip newline char, finish this line
    ADD r21, r1
    JMP wrap_line_done
wrap_no_newline:
    STORE r20, r0
    ADD r20, r1
    ADD r21, r1
    ADDI r22, 1
    CMPI r22, COLS
    JNZ r0, wrap_loop

wrap_line_done:
    LDI r0, 0
    STORE r20, r0
    CALL write_line_to_buf
    LDI r1, 1
    JMP write_remaining

llm_done:
    ; Save last response to HISTORY (first 200 chars)
    LDI r20, HISTORY
    LDI r21, RESP_BUF
    LDI r22, 0
save_history:
    CMPI r22, 200
    BGE r0, history_done
    LOAD r0, r21
    STORE r20, r0
    LDI r6, 0
    CMP r0, r6
    JZ r0, history_done
    ADD r20, r1
    ADD r21, r1
    ADDI r22, 1
    JMP save_history

history_done:
    ; Write prompt on new line
    CALL write_prompt
    JMP hk_ret

; =========================================
; COMMANDS
; =========================================

cmd_help:
    LDI r1, 1
    ; Cancel any pending /run -- asking for help is not confirmation.
    LDI r20, RUN_PENDING
    LDI r0, 0
    STORE r20, r0
    LDI r20, SCRATCH
    STRO r20, "Commands: /help /clear /sys /run /yes"
    CALL write_line_to_buf
    LDI r1, 1
    LDI r20, SCRATCH
    STRO r20, "/focus 0xNN /status /run /yes"
    CALL write_line_to_buf
    LDI r1, 1
    LDI r20, SCRATCH
    STRO r20, "/yes confirms and executes it."
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

cmd_clear:
    LDI r1, 1
    ; Cancel any pending /run.
    LDI r20, RUN_PENDING
    LDI r0, 0
    STORE r20, r0
    ; Clear text buffer to spaces
    LDI r20, BUF
    LDI r6, 32
cc_clear:
    STORE r20, r6
    ADD r20, r1
    CMPI r20, BUF_END
    BLT r0, cc_clear

    ; Reset cursor
    LDI r20, CUR_ROW
    LDI r0, 0
    STORE r20, r0
    LDI r20, CUR_COL
    LDI r0, 0
    STORE r20, r0

    ; Clear history
    LDI r12, HISTORY
    LDI r16, 256
    CALL clear_buf

    ; Reset context tracking
    LDI r20, CTX_TURNS
    LDI r0, 0
    STORE r20, r0
    LDI r20, CTX_CHARS
    LDI r0, 0
    STORE r20, r0

    ; Clear command history
    LDI r20, CMD_HIST_COUNT
    LDI r0, 0
    STORE r20, r0
    LDI r20, CMD_HIST_NAV
    LDI r0, 0
    STORE r20, r0

    LDI r1, 1
    LDI r20, SCRATCH
    STRO r20, "Cleared."
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

cmd_sys:
    LDI r1, 1
    ; Cancel any pending /run.
    LDI r20, RUN_PENDING
    LDI r0, 0
    STORE r20, r0
    LDI r20, SCRATCH
    STRO r20, "Geometry OS v2.0"
    CALL write_line_to_buf
    LDI r1, 1
    LDI r20, SCRATCH
    STRO r20, "AI Terminal via ZAI"
    CALL write_line_to_buf
    LDI r1, 1
    LDI r20, SCRATCH
    STRO r20, "LLM opcode 0x9C"
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

cmd_run:
    LDI r1, 1

    ; Check if there's a response to run
    LDI r20, RESP_BUF
    LOAD r0, r20
    LDI r6, 0
    CMP r0, r6
    JNZ r0, run_has_resp

    ; No response -- show error
    LDI r20, SCRATCH
    STRO r20, "No AI response to run"
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

run_has_resp:
    ; Show status
    LDI r20, SCRATCH
    STRO r20, "Assembling response..."
    CALL write_line_to_buf
    LDI r1, 1

    ; ASM_RAM uses RESP_BUF address -- the opcode strips ``` fences automatically
    LDI r10, RESP_BUF
    ASM_RAM r10

    ; Check status at RAM[0xFFD]
    LDI r20, ASM_STATUS
    LOAD r0, r20
    LDI r6, 0
    LDI r7, 0xFFFFFFFF
    CMP r0, r7
    JNZ r0, run_check_zero

    ; Assembly failed
    LDI r20, SCRATCH
    STRO r20, "Assembly failed!"
    CALL write_line_to_buf
    LDI r1, 1
    LDI r20, SCRATCH
    STRO r20, "(Check AI output for errors)"
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

run_check_zero:
    CMP r0, r6
    JZ r0, run_failed_empty

    ; Success -- r0 = word count. Park it in RUN_PENDING and wait for /yes.
    ; AI-generated code has full VM privileges (files, network, shutdown),
    ; so we require an explicit second keystroke before RUNNEXT.
    LDI r20, RUN_PENDING
    STORE r20, r0
    LDI r1, 1

    LDI r20, SCRATCH
    STRO r20, "Compiled OK. /yes to run."
    CALL write_line_to_buf
    LDI r1, 1
    LDI r20, SCRATCH
    STRO r20, "Any other input cancels."
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

run_failed_empty:
    ; Treat zero-word output as a failure -- nothing to run.
    LDI r20, RUN_PENDING
    LDI r0, 0
    STORE r20, r0
    LDI r20, SCRATCH
    STRO r20, "Assembly produced 0 words"
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

cmd_yes:
    LDI r1, 1
    ; Check RUN_PENDING -- if zero, nothing to confirm.
    LDI r20, RUN_PENDING
    LOAD r0, r20
    LDI r6, 0
    CMP r0, r6
    JZ r0, yes_nothing_pending

    ; Clear pending flag.
    LDI r20, RUN_PENDING
    LDI r6, 0
    STORE r20, r6

    ; Build sandbox capability list and spawn child process.
    ; The child runs the assembled bytecode at 0x1000 with restricted
    ; VFS access (read/write /tmp/*, read /lib/*) and memory isolation
    ; via copy-on-write page tables.
    CALL build_sandbox_caps
    LDI r1, 1

    LDI r20, SCRATCH
    STRO r20, "Spawning sandbox..."
    CALL write_line_to_buf
    LDI r1, 1

    ; SPAWNC r10, r11 -- r10=start addr, r11=caps list addr
    LDI r10, 0x1000
    LDI r11, SANDBOX_CAPS
    SPAWNC r10, r11

    ; Check result in RAM[0xFFA]
    LDI r20, ASM_STATUS
    LDI r21, 0xFFA
    LOAD r0, r21
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JZ r0, yes_spawn_failed

    ; Success -- child PID in r0
    ; Store child PID for watchdog/recovery
    LDI r20, CHILD_PID
    STORE r20, r0
    LDI r20, SCRATCH
    STRO r20, "Sandbox running."
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

yes_spawn_failed:
    LDI r20, SCRATCH
    STRO r20, "Spawn failed! Falling back to RUNNEXT."
    CALL write_line_to_buf
    LDI r1, 1
    ; Fallback -- run in-process (legacy behavior)
    RUNNEXT
    JMP hk_ret

yes_nothing_pending:
    LDI r20, SCRATCH
    STRO r20, "Nothing to confirm. Use /run first."
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

; =========================================
; /focus -- set focus opcode for targeted diagnostics
; Usage: /focus 0x40   (set focus to PSET)
;        /focus off    (clear focus)
; Writes the parsed value to RAM[0x7821].
; The asm_dev system prompt will then inject a targeted hint
; telling the LLM to exercise that specific opcode.
; =========================================
cmd_focus:
    LDI r1, 1

    ; Walk SCRATCH past "/focus" to the argument.
    ; SCRATCH+7 should be first char of argument (or space or null).
    LDI r20, SCRATCH
    ADDI r20, 7           ; skip "/focus"
    LOAD r22, r20
    CMPI r22, 0
    JZ r0, focus_show     ; bare "/focus" with no arg -> show current

    ; Skip spaces between /focus and arg
focus_skip_space:
    CMPI r22, 32          ; space
    JNZ r0, focus_parse_arg
    ADDI r20, 1
    LOAD r22, r20
    CMPI r22, 0
    JNZ r0, focus_skip_space
    JMP focus_show        ; trailing spaces only -> show current

focus_parse_arg:
    ; Check for "off" -> clear focus
    CMPI r22, 111         ; 'o'
    JNZ r0, focus_try_hex
    ADDI r20, 1
    LOAD r22, r20
    CMPI r22, 102         ; 'f'
    JNZ r0, focus_try_hex
    ADDI r20, 1
    LOAD r22, r20
    CMPI r22, 102         ; 'f'
    JNZ r0, focus_try_hex
    ; "off" matched -- clear focus
    LDI r20, 0x7821
    LDI r0, 0
    STORE r20, r0
    LDI r20, SCRATCH
    STRO r20, "Focus cleared."
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

focus_try_hex:
    ; Expect "0x" prefix then 2 hex digits
    ; r20 currently points to first char of argument (after "/focus ")
    ; We reload from SCRATCH+7 and re-skip spaces because r20 may be stale.
    LDI r21, SCRATCH
    ADDI r21, 7           ; reset to after "/focus"
    ; Re-skip spaces
focus_hex_skip:
    LOAD r22, r21
    CMPI r22, 32
    JZ r0, focus_hex_next
    JMP focus_hex_check
focus_hex_next:
    ADDI r21, 1
    JMP focus_hex_skip

focus_hex_check:
    LOAD r22, r21
    CMPI r22, 48          ; '0'
    JNZ r0, focus_bad_arg
    ADDI r21, 1
    LOAD r22, r21
    CMPI r22, 120         ; 'x'
    JNZ r0, focus_bad_arg
    ADDI r21, 1

    ; Parse first hex digit into r23 (high nibble)
    LOAD r22, r21
    LDI r23, 0
    ; Check '0'-'9': r22 >= 48 AND r22 < 58
    CMPI r22, 48
    BLT r0, focus_hi_not_digit   ; r22 < 48, not '0'-'9'
    CMPI r22, 58
    BGE r0, focus_hi_not_digit   ; r22 >= 58, past '9'
    ; It IS '0'-'9'
    SUBI r22, 48
    MOV r23, r22
    SHLI r23, 4
    JMP focus_lo_digit_start

focus_hi_not_digit:
    ; Check 'A'-'F': r22 >= 65 AND r22 < 71
    CMPI r22, 65
    BLT r0, focus_hi_not_upper   ; < 'A'
    CMPI r22, 71
    BGE r0, focus_hi_not_upper   ; > 'F'
    ; It IS 'A'-'F'
    SUBI r22, 55                 ; 'A'=65 -> 10
    MOV r23, r22
    SHLI r23, 4
    JMP focus_lo_digit_start

focus_hi_not_upper:
    ; Check 'a'-'f': r22 >= 97 AND r22 < 103
    CMPI r22, 97
    BLT r0, focus_bad_arg
    CMPI r22, 103
    BGE r0, focus_bad_arg
    ; It IS 'a'-'f'
    SUBI r22, 87                 ; 'a'=97 -> 10
    MOV r23, r22
    SHLI r23, 4

focus_lo_digit_start:
    ADDI r21, 1

    ; Parse second hex digit
    LOAD r22, r21
    ; Check '0'-'9'
    CMPI r22, 48
    BLT r0, focus_lo_not_digit
    CMPI r22, 58
    BGE r0, focus_lo_not_digit
    SUBI r22, 48
    OR r23, r22
    JMP focus_write

focus_lo_not_digit:
    ; Check 'A'-'F'
    CMPI r22, 65
    BLT r0, focus_lo_not_upper
    CMPI r22, 71
    BGE r0, focus_lo_not_upper
    SUBI r22, 55
    OR r23, r22
    JMP focus_write

focus_lo_not_upper:
    ; Check 'a'-'f'
    CMPI r22, 97
    BLT r0, focus_bad_arg
    CMPI r22, 103
    BGE r0, focus_bad_arg
    SUBI r22, 87
    OR r23, r22

focus_write:

    ; Write to RAM[0x7821]
    LDI r20, 0x7821
    STORE r20, r23

    ; Show confirmation
    LDI r20, SCRATCH
    STRO r20, "Focus set: 0x"
    CALL advance_to_null
    ; Append 2 hex digits
    MOV r0, r23
    SHRI r0, 4
    CALL hex_digit_char
    STORE r20, r0
    ADDI r20, 1
    MOV r0, r23
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r20, r0
    ADDI r20, 1
    LDI r0, 0
    STORE r20, r0
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

focus_show:
    ; Show current focus value
    LDI r20, 0x7821
    LOAD r23, r20
    LDI r20, SCRATCH
    STRO r20, "Focus: 0x"
    CALL advance_to_null
    MOV r0, r23
    SHRI r0, 4
    CALL hex_digit_char
    STORE r20, r0
    ADDI r20, 1
    MOV r0, r23
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r20, r0
    ADDI r20, 1
    LDI r0, 0
    STORE r20, r0
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

focus_bad_arg:
    LDI r20, SCRATCH
    STRO r20, "Usage: /focus 0xNN or /focus off"
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

; =========================================
; /status -- display focus opcode and last assemble result
; =========================================
cmd_status:
    LDI r1, 1

    ; Show focus opcode
    LDI r20, 0x7821
    LOAD r23, r20
    LDI r20, SCRATCH
    STRO r20, "Focus opcode: 0x"
    CALL advance_to_null
    MOV r0, r23
    SHRI r0, 4
    CALL hex_digit_char
    STORE r20, r0
    ADDI r20, 1
    MOV r0, r23
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r20, r0
    ADDI r20, 1
    LDI r0, 0
    STORE r20, r0
    CALL write_line_to_buf
    LDI r1, 1

    ; Show last assemble status (simplified: FAILED / OK / no assembly yet)
    LDI r20, ASM_STATUS
    LOAD r23, r20
    LDI r7, 0xFFFFFFFF
    CMP r23, r7
    JNZ r0, status_not_failed
    LDI r20, SCRATCH
    STRO r20, "ASM: FAILED"
    CALL write_line_to_buf
    LDI r1, 1
    JMP status_done

status_not_failed:
    LDI r7, 0
    CMP r23, r7
    JNZ r0, status_has_count
    LDI r20, SCRATCH
    STRO r20, "ASM: no assembly yet"
    CALL write_line_to_buf
    LDI r1, 1
    JMP status_done

status_has_count:
    LDI r20, SCRATCH
    STRO r20, "ASM: compiled OK"
    CALL write_line_to_buf
    LDI r1, 1

status_done:
    ; Show prompt mode
    LDI r20, 0x7820
    LOAD r23, r20
    CMPI r23, 1
    JNZ r0, status_oracle_mode
    LDI r20, SCRATCH
    STRO r20, "Prompt: asm_dev (opcode-aware)"
    CALL write_line_to_buf
    LDI r1, 1
    JMP status_final

status_oracle_mode:
    LDI r20, SCRATCH
    STRO r20, "Prompt: oracle (world guide)"
    CALL write_line_to_buf
    LDI r1, 1

status_final:
    CALL write_prompt
    JMP hk_ret

; =========================================
; =========================================
; /debug -- inspect spawned child via Page 3 mailbox
; Usage: /debug ping   -- ping child's debug stub
;        /debug regs   -- dump child's registers
; =========================================
cmd_debug:
    LDI r1, 1
    LDI r20, SCRATCH
    ADDI r20, 7
    LOAD r22, r20
    CMPI r22, 0
    JZ r0, debug_usage

debug_skip_space:
    CMPI r22, 32
    JNZ r0, debug_parse_arg
    ADDI r20, 1
    LOAD r22, r20
    CMPI r22, 0
    JNZ r0, debug_skip_space
    JMP debug_usage

debug_parse_arg:
    CMPI r22, 112
    JNZ r0, debug_try_regs
    ADDI r20, 1
    LOAD r22, r20
    CMPI r22, 105
    JNZ r0, debug_try_regs
    ADDI r20, 1
    LOAD r22, r20
    CMPI r22, 110
    JNZ r0, debug_try_regs
    ADDI r20, 1
    LOAD r22, r20
    CMPI r22, 103
    JNZ r0, debug_try_regs
    JMP debug_do_ping

debug_try_regs:
    LDI r20, SCRATCH
    ADDI r20, 7
debug_regs_skip:
    LOAD r22, r20
    CMPI r22, 32
    JNZ r0, debug_regs_check
    ADDI r20, 1
    JMP debug_regs_skip
debug_regs_check:
    CMPI r22, 114
    JNZ r0, debug_usage
    ADDI r20, 1
    LOAD r22, r20
    CMPI r22, 101
    JNZ r0, debug_usage
    ADDI r20, 1
    LOAD r22, r20
    CMPI r22, 103
    JNZ r0, debug_usage
    ADDI r20, 1
    LOAD r22, r20
    CMPI r22, 115
    JNZ r0, debug_usage
    JMP debug_do_regs

debug_do_ping:
    LDI r20, DEBUG_MAGIC
    LOAD r22, r20
    LDI r23, 0xDB9900
    CMP r22, r23
    JNZ r0, debug_no_stub
    LDI r0, 3
    LDI r20, DEBUG_COMMAND
    STORE r20, r0
    LDI r0, 1
    LDI r20, DEBUG_STATUS
    STORE r20, r0
    LDI r6, 200
debug_ping_wait:
    FRAME
    LDI r20, DEBUG_STATUS
    LOAD r22, r20
    CMPI r22, 2
    JZ r0, debug_ping_ok
    SUBI r6, 1
    CMPI r6, 0
    JNZ r0, debug_ping_wait
    JMP debug_timeout

debug_ping_ok:
    LDI r0, 0
    LDI r20, DEBUG_STATUS
    STORE r20, r0
    LDI r20, SCRATCH
    STRO r20, "Debug stub: PONG"
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

debug_do_regs:
    LDI r20, DEBUG_MAGIC
    LOAD r22, r20
    LDI r23, 0xDB9900
    CMP r22, r23
    JNZ r0, debug_no_stub
    LDI r0, 1
    LDI r20, DEBUG_COMMAND
    STORE r20, r0
    LDI r0, 1
    LDI r20, DEBUG_STATUS
    STORE r20, r0
    LDI r6, 200
debug_regs_wait:
    FRAME
    LDI r20, DEBUG_STATUS
    LOAD r22, r20
    CMPI r22, 2
    JZ r0, debug_regs_got
    SUBI r6, 1
    CMPI r6, 0
    JNZ r0, debug_regs_wait
    JMP debug_timeout

debug_regs_got:
    LDI r0, 0
    LDI r20, DEBUG_STATUS
    STORE r20, r0
    LDI r20, SCRATCH
    STRO r20, "r0="
    CALL advance_to_null
    LDI r21, DEBUG_RESPONSE
    LOAD r22, r21
    CALL append_hex8
    CALL write_line_to_buf
    LDI r1, 1
    LDI r20, SCRATCH
    STRO r20, "r1="
    CALL advance_to_null
    LDI r21, DEBUG_RESPONSE
    ADDI r21, 1
    LOAD r22, r21
    CALL append_hex8
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

append_hex8:
    PUSH r22
    PUSH r23
    LDI r23, 28
ah8_loop:
    MOV r0, r22
    SHR r0, r23
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r20, r0
    ADDI r20, 1
    SUBI r23, 4
    CMPI r23, 0
    BGE r0, ah8_loop
    LDI r0, 0
    STORE r20, r0
    POP r23
    POP r22
    RET

debug_no_stub:
    LDI r20, SCRATCH
    STRO r20, "No debug stub detected"
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

debug_timeout:
    LDI r20, SCRATCH
    STRO r20, "Debug: timeout"
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

debug_usage:
    LDI r20, SCRATCH
    STRO r20, "Usage: /debug ping|regs"
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

; HEX_DIGIT_CHAR -- convert nibble (0-15) to ASCII hex char
; Input: r0 = nibble value (0-15)
; Output: r0 = ASCII char
; =========================================
hex_digit_char:
    CMPI r0, 10
    BGE r0, hdc_alpha
    ADDI r0, 48           ; '0' + val
    RET

hdc_alpha:
    ADDI r0, 55           ; 'A' + (val-10)
    RET

; =========================================
; WRITE_PROMPT -- write "> " on current row
; =========================================
write_prompt:
    PUSH r31
    LDI r1, 1
    LDI r20, CUR_ROW
    LOAD r2, r20
    LDI r3, COLS
    MUL r2, r3
    LDI r20, BUF
    ADD r20, r2
    LDI r0, 62           ; '>'
    STORE r20, r0
    ADD r20, r1
    LDI r0, 32           ; ' '
    STORE r20, r0
    LDI r20, CUR_COL
    LDI r0, 2
    STORE r20, r0
    POP r31
    RET

; =========================================
; EXTRACT_CMD
; Copy chars from BUF[row*COLS+2 .. row*COLS+col-1] into SCRATCH
; Null terminate.
; =========================================
extract_cmd:
    PUSH r31
    LDI r1, 1

    ; Compute base = row * COLS
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r7, COLS
    MUL r6, r7

    ; Get end position (cursor col)
    LDI r20, CUR_COL
    LOAD r7, r20

    ; Source starts at col 2 (skip "> ")
    LDI r20, BUF
    ADD r20, r6
    ADD r20, r1
    ADD r20, r1

    ; Destination
    LDI r21, SCRATCH

    ; Copy loop: copy chars from col 2 to cursor col
    LDI r22, 2            ; current column index
ec_loop:
    CMP r22, r7
    BGE r0, ec_done

    LOAD r0, r20
    STORE r21, r0

    ADD r20, r1
    ADD r21, r1
    ADD r22, r1
    JMP ec_loop

ec_done:
    LDI r0, 0
    STORE r21, r0
    POP r31
    RET

; =========================================
; WRITE_LINE_TO_BUF
; Write null-terminated string from SCRATCH to current buffer row
; Then advance to next line
; =========================================
write_line_to_buf:
    PUSH r31
    LDI r1, 1

    ; Compute dest: BUF + row*COLS
    LDI r20, CUR_ROW
    LOAD r2, r20
    LDI r3, COLS
    MUL r2, r3
    LDI r20, BUF
    ADD r20, r2

    ; Source
    LDI r21, SCRATCH

wlb_loop:
    LOAD r0, r21
    JZ r0, wlb_done
    STORE r20, r0
    ADD r20, r1
    ADD r21, r1
    JMP wlb_loop

wlb_done:
    CALL do_newline
    POP r31
    RET

; =========================================
; DO_BACKSPACE
; =========================================
do_backspace:
    LDI r20, CUR_COL
    LOAD r0, r20
    ; Don't go past column 2 (the "> " prompt)
    CMPI r0, 2
    JNZ r0, hk_ret       ; if col <= 2, do nothing (JNZ after CMPI means not-equal)
    ; Actually: CMPI r0, 2 sets r0 to 0 if equal. So JNZ r0 means "if not 2"
    ; We want to proceed only if r0 > 2
    LDI r1, 1
    LDI r20, CUR_COL
    LOAD r0, r20
    CMPI r0, 2
    JZ r0, hk_ret        ; at prompt, do nothing

    SUBI r0, 1
    STORE r20, r0
    ; Clear char at new position
    LDI r20, CUR_ROW
    LOAD r2, r20
    LDI r3, COLS
    MUL r2, r3
    LDI r20, CUR_COL
    LOAD r0, r20
    ADD r2, r0
    LDI r20, BUF
    ADD r20, r2
    LDI r0, 32
    STORE r20, r0
    JMP hk_ret

; =========================================
; DO_NEWLINE
; =========================================
do_newline:
    LDI r1, 1
    LDI r20, CUR_COL
    LDI r0, 0
    STORE r20, r0
    LDI r20, CUR_ROW
    LOAD r6, r20
    ADD r6, r1
    CMPI r6, ROWS
    BLT r0, dn_store
    PUSH r31
    CALL scroll_up
    POP r31
    LDI r20, CUR_ROW
    LDI r6, 29
dn_store:
    STORE r20, r6
    RET

; =========================================
; SCROLL_UP
; Shift all text rows up by 1, clear last row
; =========================================
scroll_up:
    PUSH r31
    LDI r1, 1
    LDI r10, 0
scroll_loop:
    CMPI r10, 29
    BGE r0, scroll_clear

    ; Source: BUF + (row+1)*COLS
    LDI r20, BUF
    LDI r0, 0
    ADD r0, r10
    ADD r0, r1
    LDI r11, COLS
    MUL r0, r11
    ADD r20, r0

    ; Dest: BUF + row*COLS
    LDI r21, BUF
    LDI r0, 0
    ADD r0, r10
    LDI r11, COLS
    MUL r0, r11
    ADD r21, r0

    ; Copy COLS words
    LDI r22, 0
scroll_copy:
    LOAD r0, r20
    STORE r21, r0
    ADD r20, r1
    ADD r21, r1
    ADD r22, r1
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r10, r1
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r6, 29
    LDI r11, COLS
    MUL r6, r11
    ADD r20, r6
    LDI r6, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r6
    ADD r20, r1
    ADD r22, r1
    CMPI r22, COLS
    BLT r0, scroll_clr_loop

    POP r31
    RET

; =========================================
; UTILITY: strlen_prompt_buf
; Counts chars in PROMPT_BUF until null terminator.
; Input: r20 = PROMPT_BUF address
; Output: r0 = length (does NOT clobber r20)
; Clobbers: r0, r11, r12
; =========================================
strlen_prompt_buf:
    PUSH r31
    MOV r11, r20         ; save r20
    LDI r0, 0
sp_strlen_loop:
    LOAD r12, r20
    JZ r12, sp_strlen_done
    ADDI r0, 1
    ADDI r20, 1
    JMP sp_strlen_loop
sp_strlen_done:
    MOV r20, r11         ; restore r20
    POP r31
    RET

; =========================================
; UTILITY: advance_to_null (r19)
; =========================================
advance_to_null:
    PUSH r31
adv_loop:
    LOAD r12, r19
    LDI r13, 0
    CMP r12, r13
    JZ r0, adv_done
    ADDI r19, 1
    JMP adv_loop
adv_done:
    POP r31
    RET

; =========================================
; UTILITY: copy_until_null (r18 -> r19)
; =========================================
copy_until_null:
    PUSH r31
cun_loop:
    LOAD r12, r18
    LDI r13, 0
    CMP r12, r13
    JZ r0, cun_done
    STORE r19, r12
    ADDI r18, 1
    ADDI r19, 1
    JMP cun_loop
cun_done:
    LDI r12, 0
    STORE r19, r12
    POP r31
    RET

; =========================================
; UTILITY: clear_buf (r12=start, r16=count)
; =========================================
clear_buf:
    PUSH r31
    PUSH r12
    PUSH r16
    LDI r13, 0
cb_loop:
    JZ r16, cb_done
    STORE r12, r13
    ADDI r12, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r12
    POP r31
    RET

; =========================================
; BUILD_SANDBOX_CAPS -- construct capability
; list at SANDBOX_CAPS for SPAWNC.
; Grants: /tmp/* (read+write), /lib/* (read)
; Pattern strings at SANDBOX_STRS.
; =========================================
build_sandbox_caps:
    PUSH r31
    LDI r1, 1

    ; Write pattern strings
    ; "/tmp/*" at SANDBOX_STRS (0x7600)
    LDI r20, SANDBOX_STRS
    STRO r20, "/tmp/*"

    ; "/lib/*" at SANDBOX_STRS+16 (0x7610)
    LDI r20, SANDBOX_STRS
    ADDI r20, 16
    STRO r20, "/lib/*"

    ; Build capability struct at SANDBOX_CAPS (0x7500)
    ; [0x7500]: 2 (n_entries)
    LDI r20, SANDBOX_CAPS
    LDI r6, 2
    STORE r20, r6

    ; Entry 0: VFS path /tmp/* with read+write (0x03)
    ; [0x7501]: resource_type = 0 (VFS path)
    LDI r20, SANDBOX_CAPS
    ADDI r20, 1
    LDI r6, 0
    STORE r20, r6
    ; [0x7502]: pattern_addr = 0x7600
    ADDI r20, 1
    LDI r6, SANDBOX_STRS
    STORE r20, r6
    ; [0x7503]: pattern_len = 6
    ADDI r20, 1
    LDI r6, 6
    STORE r20, r6
    ; [0x7504]: permissions = 0x03 (read+write)
    ADDI r20, 1
    LDI r6, 3
    STORE r20, r6

    ; Entry 1: VFS path /lib/* with read (0x01)
    ; [0x7505]: resource_type = 0 (VFS path)
    ADDI r20, 1
    LDI r6, 0
    STORE r20, r6
    ; [0x7506]: pattern_addr = 0x7610
    ADDI r20, 1
    LDI r6, SANDBOX_STRS
    ADDI r6, 16
    STORE r20, r6
    ; [0x7507]: pattern_len = 6
    ADDI r20, 1
    LDI r6, 6
    STORE r20, r6
    ; [0x7508]: permissions = 0x01 (read only)
    ADDI r20, 1
    LDI r6, 1
    STORE r20, r6

    ; [0x7509]: sentinel 0xFFFFFFFF
    ADDI r20, 1
    LDI r6, 0xFFFFFFFF
    STORE r20, r6

    POP r31
    RET

hk_ret:
    POP r31
    RET

; =========================================
; CHECK_WATCHDOG -- monitor child heartbeat
; =========================================
check_watchdog:
    PUSH r31
    LDI r1, 1

    ; Decrement watchdog timer
    LDI r20, WATCHDOG_TIMER
    LOAD r0, r20
    SUBI r0, 1
    STORE r20, r0
    CMPI r0, 0
    JNZ r0, cw_done     ; Not time to check yet

    ; Reset timer to 60 frames (1 second)
    LDI r0, 60
    STORE r20, r0

    ; Check if child is active (DEBUG_MAGIC)
    LDI r20, DEBUG_MAGIC
    LOAD r22, r20
    LDI r23, 0xDB9900
    CMP r22, r23
    JNZ r0, cw_done     ; No child active

    ; Read heartbeat
    LDI r20, DEBUG_HEARTBEAT
    LOAD r22, r20

    ; Compare with last seen heartbeat
    LDI r20, LAST_HEARTBEAT
    LOAD r23, r20
    CMP r22, r23
    JZ r0, cw_flatline   ; Heartbeat hasn't changed!

    ; Heartbeat is moving. Store new value and clear strikes.
    STORE r20, r22
    LDI r20, WATCHDOG_STRIKES
    LDI r0, 0
    STORE r20, r0
    JMP cw_done

cw_flatline:
    ; Heartbeat is stuck. Increment strikes.
    LDI r20, WATCHDOG_STRIKES
    LOAD r0, r20
    ADDI r0, 1
    STORE r20, r0
    CMPI r0, 3          ; 3 strikes (3 seconds of flatline)
    BGE r0, trigger_heal
    JMP cw_done

cw_done:
    POP r31
    RET

; =========================================
; TRIGGER_HEAL -- Autonomous fault recovery
; Kills flatlined child, sends fault context to LLM,
; sets RECOVERY_MODE so the response auto-executes.
; =========================================
trigger_heal:
    PUSH r31

    ; Log the fault
    LDI r20, SCRATCH
    STRO r20, "FAULT: Child flatline!"
    CALL write_line_to_buf
    LDI r1, 1

    ; Kill the old child
    LDI r20, CHILD_PID
    LOAD r10, r20
    LDI r11, 0              ; Signal 0 = SIGTERM
    SIGNAL r10, r11
    ; Ignore result -- child may already be dead

    LDI r20, SCRATCH
    STRO r20, "Killed child process"
    CALL write_line_to_buf
    LDI r1, 1

    ; ── Build fault prompt in PROMPT_BUF ──
    LDI r19, PROMPT_BUF

    ; System context
    STRO r19, "You are a debugging AI inside Geometry OS. A program you wrote just crashed. "
    CALL advance_to_null
    STRO r19, "Fix the bug. Output ONLY the corrected assembly code in a code block. Be concise."
    CALL advance_to_null

    ; Newline
    LDI r12, 10
    STORE r19, r12
    ADDI r19, 1
    STORE r19, r12
    ADDI r19, 1

    ; Fault context
    STRO r19, "FAULT: Program flatlined (heartbeat stopped for 3 seconds)."
    CALL advance_to_null
    LDI r12, 10
    STORE r19, r12
    ADDI r19, 1

    ; Checkpoint PC
    STRO r19, "Last checkpoint PC: 0x"
    CALL advance_to_null
    LDI r20, DEBUG_CHECKPOINT
    LOAD r0, r20
    CALL write_hex_to_buf   ; writes 8 hex chars to r19

    LDI r12, 10
    STORE r19, r12
    ADDI r19, 1

    ; Append source if available (RESP_BUF still has last LLM output)
    LDI r20, RESP_BUF
    LOAD r12, r20
    LDI r13, 0
    CMP r12, r13
    JZ r0, heal_no_source

    STRO r19, "Original source:"
    CALL advance_to_null
    LDI r12, 10
    STORE r19, r12
    ADDI r19, 1
    LDI r18, RESP_BUF
    CALL copy_until_null

heal_no_source:
    ; Null-terminate
    LDI r12, 0
    STORE r19, r12

    ; Set recovery mode so LLM response auto-executes
    LDI r20, RECOVERY_MODE
    LDI r0, 1
    STORE r20, r0

    ; Reset watchdog strikes
    LDI r20, WATCHDOG_STRIKES
    LDI r0, 0
    STORE r20, r0

    ; Clear child PID (it's dead)
    LDI r20, CHILD_PID
    LDI r0, 0
    STORE r20, r0

    ; Call LLM
    LDI r3, PROMPT_BUF
    LDI r4, RESP_BUF
    LDI r5, 3840
    LLM r3, r4, r5

    ; Show status
    LDI r20, SCRATCH
    STRO r20, "Recovery: LLM consulted"
    CALL write_line_to_buf
    LDI r1, 1

    ; ── Auto-execute: assemble the LLM's fix and re-spawn ──
    ; Check if LLM returned anything
    LDI r20, RESP_BUF
    LOAD r0, r20
    LDI r6, 0
    CMP r0, r6
    JZ r0, heal_no_response

    ; Assemble the response
    LDI r20, SCRATCH
    STRO r20, "Recovery: assembling fix..."
    CALL write_line_to_buf
    LDI r1, 1

    LDI r10, RESP_BUF
    ASM_RAM r10

    ; Check assembly status
    LDI r20, ASM_STATUS
    LOAD r0, r20
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JZ r0, heal_asm_failed

    LDI r6, 0
    CMP r0, r6
    JZ r0, heal_asm_empty

    ; Assembly succeeded -- spawn directly (no /yes gate)
    LDI r20, SCRATCH
    STRO r20, "Recovery: re-spawning..."
    CALL write_line_to_buf
    LDI r1, 1

    CALL build_sandbox_caps
    LDI r1, 1
    LDI r10, 0x1000
    LDI r11, SANDBOX_CAPS
    SPAWNC r10, r11

    ; Check spawn result
    LDI r21, 0xFFA
    LOAD r0, r21
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JZ r0, heal_spawn_failed

    ; Success -- store new child PID
    LDI r20, CHILD_PID
    STORE r20, r0

    LDI r20, SCRATCH
    STRO r20, "Recovery: child respawned!"
    CALL write_line_to_buf
    LDI r1, 1
    JMP heal_done

heal_no_response:
    LDI r20, SCRATCH
    STRO r20, "Recovery: LLM returned nothing"
    CALL write_line_to_buf
    LDI r1, 1
    JMP heal_done

heal_asm_failed:
    LDI r20, SCRATCH
    STRO r20, "Recovery: assembly failed"
    CALL write_line_to_buf
    LDI r1, 1
    JMP heal_done

heal_asm_empty:
    LDI r20, SCRATCH
    STRO r20, "Recovery: empty assembly"
    CALL write_line_to_buf
    LDI r1, 1
    JMP heal_done

heal_spawn_failed:
    LDI r20, SCRATCH
    STRO r20, "Recovery: spawn failed"
    CALL write_line_to_buf
    LDI r1, 1

heal_done:
    ; Clear recovery mode
    LDI r20, RECOVERY_MODE
    LDI r0, 0
    STORE r20, r0

    POP r31
    RET

; =========================================
; WRITE_HEX_TO_BUF -- write 8-char hex of r0 to buffer at r19
; Input: r0 = value, r19 = buffer position
; Advances r19 by 8. Uses r2, r3 as scratch.
; =========================================
write_hex_to_buf:
    PUSH r31
    PUSH r0
    LDI r1, 1

    ; Nibble 7 (bits 31-28)
    PUSH r0
    SHRI r0, 28
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r19, r0
    ADDI r19, 1
    POP r0

    ; Nibble 6 (bits 27-24)
    PUSH r0
    SHRI r0, 24
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r19, r0
    ADDI r19, 1
    POP r0

    ; Nibble 5 (bits 23-20)
    PUSH r0
    SHRI r0, 20
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r19, r0
    ADDI r19, 1
    POP r0

    ; Nibble 4 (bits 19-16)
    PUSH r0
    SHRI r0, 16
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r19, r0
    ADDI r19, 1
    POP r0

    ; Nibble 3 (bits 15-12)
    PUSH r0
    SHRI r0, 12
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r19, r0
    ADDI r19, 1
    POP r0

    ; Nibble 2 (bits 11-8)
    PUSH r0
    SHRI r0, 8
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r19, r0
    ADDI r19, 1
    POP r0

    ; Nibble 1 (bits 7-4)
    PUSH r0
    SHRI r0, 4
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r19, r0
    ADDI r19, 1
    POP r0

    ; Nibble 0 (bits 3-0)
    ANDI r0, 0xF
    CALL hex_digit_char
    STORE r19, r0
    ADDI r19, 1

    POP r0
    POP r31
    RET

; =========================================
; RENDER_TITLE - Dynamic title bar with context info
; Shows "AI Terminal - ZAI  T:N C:M"
; =========================================
render_title:
    PUSH r31
    LDI r1, 1

    ; Title bar background
    LDI r1, 0
    LDI r2, 0
    LDI r3, 256
    LDI r4, 16
    LDI r5, 0x1A0033
    RECTF r1, r2, r3, r4, r5

    ; Title text
    LDI r20, SCRATCH
    STRO r20, "AI Terminal - ZAI"
    LDI r1, 4
    LDI r2, 4
    LDI r3, SCRATCH
    LDI r4, 0x00FF00
    LDI r5, 0x1A0033
    DRAWTEXT r1, r2, r3, r4, r5

    ; Append turn count: " T:N"
    LDI r20, SCRATCH
    CALL advance_to_null
    STRO r20, " T:"
    CALL advance_to_null

    ; Load turn count and convert to decimal
    LDI r20, CTX_TURNS
    LOAD r0, r20
    CALL u32_to_dec_str
    ; u32_to_dec_str writes digits to SCRATCH at current pos

    ; Append chars count: " C:M"
    LDI r20, SCRATCH
    CALL advance_to_null
    STRO r20, " C:"
    CALL advance_to_null

    ; Load chars count and convert to decimal
    LDI r20, CTX_CHARS
    LOAD r0, r20
    CALL u32_to_dec_str

    ; Draw the title
    LDI r1, 4
    LDI r2, 4
    LDI r3, SCRATCH
    LDI r4, 0x00FF00
    LDI r5, 0x1A0033
    DRAWTEXT r1, r2, r3, r4, r5

    ; Status indicator dot (green)
    LDI r1, 230
    LDI r2, 4
    LDI r3, 8
    LDI r4, 8
    LDI r5, 0x00FF00
    RECTF r1, r2, r3, r4, r5

    ; History indicator (small amber dot if history has entries)
    LDI r20, CMD_HIST_COUNT
    LOAD r0, r20
    JZ r0, title_no_hist
    LDI r1, 216
    LDI r2, 4
    LDI r3, 6
    LDI r4, 6
    LDI r5, 0xFFAA00
    RECTF r1, r2, r3, r4, r5
title_no_hist:

    POP r31
    RET

; =========================================
; U32_TO_DEC_STR - Convert u32 to decimal ASCII
; Input: r0 = number (capped at 9999)
; Output: writes decimal digits to SCRATCH at current null-terminator position
;         advances SCRATCH pointer past the digits + null
; Clobbers: r0, r6, r7
; =========================================
u32_to_dec_str:
    ; Find null terminator in SCRATCH
    LDI r20, SCRATCH
    CALL advance_to_null
    ; r20 now points at the null

    ; Cap at 9999 to keep it short
    LDI r7, 9999
    CMP r0, r7
    BLT r0, u2d_notcap
    LDI r0, 9999
u2d_notcap:

    ; We need to extract decimal digits.
    ; For numbers < 10000: thousands, hundreds, tens, ones.
    ; Skip leading zeros.
    LDI r6, 0            ; digit count (suppressed leading zeros)
    LDI r7, 1000

    ; Thousands digit
    LDI r6, 0
    MOV r6, r0
    DIV r6, r7           ; r6 = n / 1000
    JZ r6, u2d_no_thou
    ADDI r6, 48          ; '0' + digit
    STORE r20, r6
    ADDI r20, 1
u2d_no_thou:

    ; Hundreds digit: (n / 100) % 10
    MOV r6, r0
    LDI r7, 100
    DIV r6, r7           ; r6 = n / 100
    LDI r7, 10
    MOD r6, r7           ; r6 = (n/100) % 10 = hundreds digit

    ; Check if we should skip (no thousands AND hundreds is 0)
    LDI r7, 1000
    CMP r0, r7
    BLT r0, u2d_skip_hun
    JZ r6, u2d_skip_hun
    ADDI r6, 48
    STORE r20, r6
    ADDI r20, 1
u2d_skip_hun:

    ; Tens digit
    MOV r6, r0
    LDI r7, 10
    DIV r6, r7           ; r6 = n / 10
    MOD r6, r7           ; r6 = (n/10) % 10 = tens digit

    ; Check if we should skip (n < 10 AND no prior digits)
    LDI r7, 10
    CMP r0, r7
    BLT r0, u2d_skip_ten
    JZ r6, u2d_skip_ten
    ADDI r6, 48
    STORE r20, r6
    ADDI r20, 1
u2d_skip_ten:

    ; Ones digit (always print)
    MOV r6, r0
    LDI r7, 10
    MOD r6, r7           ; r6 = n % 10
    ADDI r6, 48
    STORE r20, r6
    ADDI r20, 1

    ; Null terminate
    LDI r0, 0
    STORE r20, r0

    RET

; =========================================
; HISTORY_SAVE - Save current prompt to history ring buffer
; Called from do_enter after extract_cmd.
; The command text is in SCRATCH (null-terminated).
; =========================================
history_save:
    PUSH r31
    LDI r1, 1

    ; Check if SCRATCH is empty (just "> " with no text after)
    LDI r20, SCRATCH
    LOAD r0, r20
    CMPI r0, 0
    JZ r0, hist_save_done  ; empty command, skip

    ; Load history count
    LDI r20, CMD_HIST_COUNT
    LOAD r6, r20          ; r6 = count

    ; Don't save duplicates of the most recent entry
    CMPI r6, 0
    JZ r6, hist_not_dup
    ; Compare SCRATCH with last entry
    ; Last entry index = (count - 1) % 8
    SUBI r6, 1
    LDI r7, 8
    MOD r6, r7           ; r6 = last entry index
    LDI r7, 42
    MUL r6, r7           ; r6 = byte offset of last entry
    ADDI r6, CMD_HIST_BASE ; r6 = address of last entry
    CALL strcmp_scratch    ; sets r0 = 0 if equal
    JZ r0, hist_save_done ; duplicate, skip

hist_not_dup:
    ; Reload count
    LDI r20, CMD_HIST_COUNT
    LOAD r6, r20

    ; Write index = count % 8
    MOV r7, r6
    LDI r8, 8
    MOD r7, r8           ; r7 = write index

    ; Compute dest address = CMD_HIST_BASE + write_index * 42
    LDI r9, 42
    MUL r7, r9
    ADDI r7, CMD_HIST_BASE

    ; Copy 42 chars from SCRATCH to dest
    LDI r16, SCRATCH
    LDI r17, 0
hist_copy:
    CMP r17, r9
    BGE r0, hist_copy_done
    LOAD r0, r16
    STORE r7, r0
    ADDI r16, 1
    ADDI r7, 1
    ADDI r17, 1
    JMP hist_copy
hist_copy_done:

    ; Increment count (cap at 8)
    LDI r20, CMD_HIST_COUNT
    LOAD r0, r20
    ADDI r0, 1
    LDI r7, 8
    CMP r0, r7
    BLT r0, hist_no_cap
    LDI r0, 8
hist_no_cap:
    STORE r20, r0

    ; Reset nav index to count (so down arrow goes to current)
    LDI r20, CMD_HIST_NAV
    LDI r0, 0
    STORE r20, r0

hist_save_done:
    POP r31
    RET

; =========================================
; STRCMP_SCRATCH - Compare SCRATCH with string at r6
; Returns r0 = 0 if equal, nonzero otherwise
; Clobbers: r0, r7, r8
; =========================================
strcmp_scratch:
    LDI r7, SCRATCH
strcmp_loop:
    LOAD r0, r7
    LOAD r8, r6
    CMP r0, r8
    JNZ r0, strcmp_neq
    JZ r0, strcmp_eq     ; both null = equal
    ADDI r7, 1
    ADDI r6, 1
    JMP strcmp_loop
strcmp_neq:
    LDI r0, 1            ; not equal
    RET
strcmp_eq:
    LDI r0, 0            ; equal
    RET

; =========================================
; HISTORY_UP - Recall previous command (up arrow)
; Replaces current prompt line with history entry
; =========================================
do_history_up:
    PUSH r31
    LDI r1, 1

    ; Load history count
    LDI r20, CMD_HIST_COUNT
    LOAD r6, r20
    JZ r6, hist_up_done  ; no history

    ; Load current nav index
    LDI r20, CMD_HIST_NAV
    LOAD r7, r20          ; r7 = current nav index

    ; Check if we can go further back
    ; max index = count - 1
    MOV r8, r6
    SUBI r8, 1
    CMP r7, r8
    BGE r0, hist_up_done  ; already at oldest

    ; If nav index is 0, save current prompt line first
    JNZ r7, hist_up_recall
    ; Save current prompt to temp slot (index = count, wraps or overflows)
    ; We save to the last slot (index = count % 8) before overwriting
    ; Actually, let's save to SCRATCH area temporarily
    CALL save_current_prompt

hist_up_recall:
    ; Increment nav index
    ADDI r7, 1
    LDI r20, CMD_HIST_NAV
    STORE r20, r7

    ; Compute history address: (count - 1 - nav_index) % 8 * 42 + CMD_HIST_BASE
    ; This walks backwards through history
    MOV r8, r6           ; r8 = count
    SUBI r8, 1           ; r8 = count - 1
    SUB r8, r7           ; r8 = count - 1 - nav_index
    LDI r9, 8
    MOD r8, r9           ; r8 = wrapped index
    LDI r9, 42
    MUL r8, r9           ; r8 = byte offset
    ADDI r8, CMD_HIST_BASE

    ; Clear current prompt line (keep "> " prefix)
    CALL clear_prompt_line

    ; Load history entry into prompt buffer
    LDI r20, PROMPT_BUF
    ADDI r20, 2          ; skip "> " prefix
    LDI r17, 0
hist_up_copy:
    CMP r17, r9
    BGE r0, hist_up_copy_done
    LOAD r0, r8
    JZ r0, hist_up_copy_done  ; stop at null terminator
    STORE r20, r0
    ADDI r8, 1
    ADDI r20, 1
    ADDI r17, 1
    JMP hist_up_copy
hist_up_copy_done:

    ; Update cursor position
    LDI r20, CUR_COL
    STORE r20, r17       ; col = number of chars copied
    ADDI r20, 2          ; but we need absolute col in display
    LDI r0, 2
    ADD r0, r17
    LDI r20, CUR_COL
    STORE r20, r0

hist_up_done:
    POP r31
    RET

; =========================================
; HISTORY_DOWN - Recall next command (down arrow)
; =========================================
do_history_down:
    PUSH r31
    LDI r1, 1

    ; Load nav index
    LDI r20, CMD_HIST_NAV
    LOAD r7, r20
    JZ r7, hist_down_done  ; already at current input

    ; Decrement nav index
    SUBI r7, 1
    LDI r20, CMD_HIST_NAV
    STORE r20, r7

    ; If nav index is now 0, restore the saved current prompt
    JNZ r7, hist_down_recall
    CALL restore_current_prompt
    JMP hist_down_done

hist_down_recall:
    ; Load history count
    LDI r20, CMD_HIST_COUNT
    LOAD r6, r20

    ; Compute address: (count - 1 - nav_index) % 8 * 42 + CMD_HIST_BASE
    MOV r8, r6
    SUBI r8, 1
    SUB r8, r7
    LDI r9, 8
    MOD r8, r9
    LDI r9, 42
    MUL r8, r9
    ADDI r8, CMD_HIST_BASE

    ; Clear current prompt line
    CALL clear_prompt_line

    ; Copy history entry
    LDI r20, PROMPT_BUF
    ADDI r20, 2
    LDI r17, 0
hist_dn_copy:
    CMP r17, r9
    BGE r0, hist_dn_copy_done
    LOAD r0, r8
    JZ r0, hist_dn_copy_done
    STORE r20, r0
    ADDI r8, 1
    ADDI r20, 1
    ADDI r17, 1
    JMP hist_dn_copy
hist_dn_copy_done:

    LDI r0, 2
    ADD r0, r17
    LDI r20, CUR_COL
    STORE r20, r0

hist_down_done:
    POP r31
    RET

; =========================================
; SAVE_CURRENT_PROMPT - Save current prompt to temp storage
; Uses PROMPT_BUF as temp (it holds current prompt anyway)
; We just need to remember we saved it
; =========================================
save_current_prompt:
    ; The current prompt is already in PROMPT_BUF
    ; Mark that we have a saved prompt by setting nav index to 0
    ; (nav=0 means "showing current input", not history)
    RET

; =========================================
; RESTORE_CURRENT_PROMPT - Restore the prompt that was active
; before history navigation started
; =========================================
restore_current_prompt:
    ; PROMPT_BUF still has the original prompt (it was saved on first up)
    ; Clear the display prompt line and redraw from PROMPT_BUF
    CALL clear_prompt_line

    ; Copy PROMPT_BUF (skip "> " prefix) back to itself (already there)
    ; Just need to reset cursor to end of prompt text
    LDI r20, PROMPT_BUF
    ADDI r20, 2          ; skip "> "
    LDI r17, 0
restore_loop:
    LOAD r0, r20
    JZ r0, restore_done
    ADDI r17, 1
    ADDI r20, 1
    JMP restore_loop
restore_done:
    LDI r0, 2
    ADD r0, r17
    LDI r20, CUR_COL
    STORE r20, r0
    RET

; =========================================
; CLEAR_PROMPT_LINE - Clear text after "> " on current row
; =========================================
clear_prompt_line:
    LDI r1, 1
    ; Get current row
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r7, COLS
    MUL r0, r7           ; r0 = row * COLS
    LDI r7, PROMPT_BUF
    ADD r7, r0           ; r7 = &PROMPT_BUF[row * COLS]

    ; Write "> " at start
    LDI r0, 62           ; '>'
    STORE r7, r0
    ADDI r7, 1
    LDI r0, 32           ; ' '
    STORE r7, r0
    ADDI r7, 1

    ; Clear rest of the line (40 more chars)
    LDI r0, 0
    LDI r17, 0
clear_prompt_loop:
    CMPI r17, 40
    BGE r0, clear_prompt_done
    STORE r7, r0
    ADDI r7, 1
    ADDI r17, 1
    JMP clear_prompt_loop
clear_prompt_done:
    RET
