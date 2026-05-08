; DESCRIPTION: The GeOS assembly code implements a terminal interface named "Hermes Agent Terminal" that interacts with an AI using the HERMES opcode (0xA8). It maintains session continuity through the VM's session ID tracking, handles basic text input and output, supports commands like `/clear` and `/help`, and displays multiline responses from the AI. The code manages a text buffer for displaying content and a scratch buffer for temporary data processing, using predefined memory regions for these purposes.

; hermes_term.asm -- Hermes Agent Terminal for Geometry OS
;
; Uses the native HERMES opcode (0xA8) for direct AI interaction.
; Maintains session continuity automatically via the VM's session ID tracking.
;
; Commands: /clear /help
;
; RAM Layout:
;   0x4000-0x44EB  Text buffer (42*30 = 1260 u32 cells, row-major)
;   0x4800         Cursor column
;   0x4801         Cursor row
;   0x4802         Blink counter
;   0x5000-0x51FF  Scratch line buffer (512 chars + null)
;   0x5800-0x5FFF  Response buffer (2048 chars)
;
; Registers:
;   r2: Result (reserved)
;   r3: Constant 1
;   r8: Key input
;   r30: Stack pointer (SP)

#define COLS 42
#define ROWS 30
#define BUF 0x4000
#define BUF_END 0x44EC
#define CUR_COL 0x4800
#define CUR_ROW 0x4801
#define BLINK 0x4802
#define SCRATCH 0x5000
#define RECV_BUF 0x5800

; =========================================
; INIT
; =========================================
LDI r3, 1
LDI r30, 0xFD00   ; Stack pointer

; Clear screen
LDI r2, 0x080812
FILL r2

; Clear text buffer to spaces
LDI r20, BUF
LDI r12, 32
clear_buf_init:
    STORE r20, r12
    ADD r20, r3
    CMPI r20, BUF_END
    BLT r2, clear_buf_init

; Init cursor and blink
LDI r20, CUR_COL
LDI r2, 0
STORE r20, r2
LDI r20, CUR_ROW
STORE r20, r2
LDI r20, BLINK
STORE r20, r2

; Title bar
LDI r3, 0
LDI r4, 0
LDI r15, 256
LDI r9, 16
LDI r8, 0x1A0033
RECTF r3, r4, r15, r9, r8

; Title text "Hermes Terminal"
LDI r20, SCRATCH
STRO r20, "Hermes Terminal"
LDI r3, 4
LDI r4, 4
LDI r15, SCRATCH
LDI r9, 0x00FF00  ; green
LDI r8, 0x1A0033  ; match title bar
DRAWTEXT r3, r4, r15, r9, r8

; Close button hit region
LDI r3, 220
LDI r4, 0
LDI r15, 36
LDI r9, 16
HITSET r3, r4, r15, r9, 99

LDI r3, 1

; Welcome messages
LDI r20, SCRATCH
STRO r20, "Hermes Terminal v2.0"
CALL write_line_to_buf
LDI r3, 1
LDI r20, SCRATCH
STRO r20, "Native Agent Bridge Active."
CALL write_line_to_buf
LDI r3, 1

CALL write_prompt
JMP main_loop

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r3, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r2, r20
    ADD r2, r3
    STORE r20, r2

    ; Render
    CALL render

    FRAME

    ; Read key
    IKEY r8
    JZ r8, main_loop

    ; Handle key
    CALL handle_key
    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r3, 1

    ; Clear content area
    LDI r3, 0
    LDI r4, 16
    LDI r15, 256
    LDI r9, 240
    LDI r8, 0x080812
    RECTF r3, r4, r15, r9, r8

    ; Row loop
    LDI r3, 1
    LDI r1, 8            ; CHAR_H
    LDI r6, 6            ; CHAR_W
    LDI r5, 0           ; row counter
    LDI r13, BUF         ; buffer pointer
    LDI r0, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to temporary display scratch
    ; We use 0x6000 as a temporary display scratch to avoid overwriting SCRATCH or RECV_BUF
    LDI r16, 0x6000
    LDI r17, 0
copy_col:
    LOAD r12, r13
    STORE r16, r12
    ADD r13, r3
    ADD r16, r3
    ADD r17, r3
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r2, 0
    STORE r16, r2

    ; Color based on content
    LDI r14, 0xCCCCCC  ; default light gray

    ; Check if row starts with '>' (user prompt) -> green
    LDI r16, 0x6000
    LOAD r12, r16
    CMPI r12, 62         ; '>'
    JNZ r2, render_text_default
    LDI r14, 0x44FF44  ; green for user input
    JMP render_text

render_text_default:
    LDI r14, 0x00FFFF  ; cyan for AI responses

render_text:
    ; DRAWTEXT x=0, y=r0, addr=0x6000, fg=r14, bg=0 (transparent)
    LDI r3, 0
    LDI r11, 0x6000
    LDI r7, 0         ; bg = transparent
    DRAWTEXT r3, r0, r11, r14, r7

    LDI r3, 1

    ADD r0, r1          ; y += 8
    ADD r5, r3          ; row++
    CMPI r5, ROWS
    BLT r5, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r2, r20
    LDI r10, 8
    AND r2, r10
    CMPI r2, 4
    BLT r2, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r2, r20
    MUL r2, r6           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r4, r20
    MUL r4, r1           ; row * 8
    LDI r15, 16
    ADD r4, r15           ; y = 16 + row*8
    LDI r15, 6
    LDI r9, 8
    LDI r8, 0x44FF44
    RECTF r2, r4, r15, r9, r8

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r8 = key
; =========================================
handle_key:
    PUSH r31
    LDI r3, 1

    CMPI r8, 13
    JNZ r2, check_bs
    JMP do_enter

check_bs:
    CMPI r8, 8
    JNZ r2, check_del
    JMP do_backspace

check_del:
    CMPI r8, 127
    JNZ r2, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r4, r20
    LDI r15, COLS
    MUL r4, r15           ; r4 = row * COLS
    LDI r20, CUR_COL
    LOAD r2, r20
    ADD r4, r2           ; r4 = row*COLS + col
    LDI r20, BUF
    ADD r20, r4          ; r20 = BUF + offset
    STORE r20, r8        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r2, r20
    ADD r2, r3
    STORE r20, r2

    ; If col >= COLS, wrap
    CMPI r2, COLS
    JNZ r2, hk_ret
    CALL do_newline
    JMP hk_ret

; =========================================
; DO_ENTER -- handle commands or call AI
; =========================================
do_enter:
    ; 1. Extract command text from current row into SCRATCH
    CALL extract_cmd

    ; 2. Advance to next row
    CALL do_newline

    ; 3. Check for / commands
    LDI r3, 1
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 47         ; '/'
    JNZ r2, call_hermes_ai  ; not a command, call AI

    ; Check /help
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r2, try_clear_cmd
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r2, try_clear_cmd
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r2, try_clear_cmd
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r2, try_clear_cmd
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r2, call_hermes_ai
    JMP cmd_help

try_clear_cmd:
    ; Check /clear
    LDI r20, SCRATCH
    ADD r20, r3           ; skip '/'
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r2, call_hermes_ai
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r2, call_hermes_ai
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r2, call_hermes_ai
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r2, call_hermes_ai
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r2, call_hermes_ai
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r2, call_hermes_ai
    JMP cmd_clear

    ; If not a known command, just call AI
    JMP call_hermes_ai

; =========================================
; COMMANDS
; =========================================
cmd_help:
    LDI r3, 1
    LDI r20, SCRATCH
    STRO r20, "/help /clear"
    CALL write_line_to_buf
    LDI r3, 1
    CALL write_prompt
    JMP hk_ret

cmd_clear:
    LDI r3, 1
    ; Clear text buffer to spaces
    LDI r20, BUF
    LDI r12, 32
clear_buf_cmd:
    STORE r20, r12
    ADD r20, r3
    CMPI r20, BUF_END
    BLT r2, clear_buf_cmd
    ; Reset cursor
    LDI r20, CUR_COL
    LDI r2, 0
    STORE r20, r2
    LDI r20, CUR_ROW
    STORE r20, r2
    CALL write_prompt
    JMP hk_ret

; =========================================
; CALL_HERMES_AI
; Call the HERMES opcode and process response
; =========================================
call_hermes_ai:
    LDI r3, 1

    ; Show "thinking" indicator
    LDI r20, SCRATCH
    STRO r20, "..."
    CALL write_line_to_buf
    LDI r3, 1
    CALL render  ; Force render to show "..."
    FRAME

    ; HERMES prompt_addr_reg, response_addr_reg, max_len_reg
    ; prompt is in SCRATCH, we'll put response in RECV_BUF
    LDI r4, SCRATCH
    LDI r15, RECV_BUF
    LDI r9, 2048
    HERMES r4, r15, r9

    ; Remove the "..." line (actually just overwrite it)
    ; We'll scroll up once to clear the "..." before writing response
    ; Wait, write_line_to_buf already advanced the row.
    ; Let's just write the response.

    ; If r2 == 0, something went wrong
    CMPI r2, 0
    JZ r2, hermes_failed

    ; Process the multiline response in RECV_BUF
    CALL process_response_buffer
    JMP call_hermes_done

hermes_failed:
    LDI r20, SCRATCH
    STRO r20, "Agent call failed."
    CALL write_line_to_buf

call_hermes_done:
    LDI r3, 1
    CALL write_prompt
    JMP hk_ret

; =========================================
; PROCESS_RESPONSE_BUFFER
; Split RECV_BUF by newlines and write each line
; =========================================
process_response_buffer:
    PUSH r31
    LDI r3, 1

    LDI r20, RECV_BUF
    LDI r21, SCRATCH      ; build current line into SCRATCH
    LDI r22, 0            ; char count

prb_loop:
    LOAD r2, r20
    JZ r2, prb_final      ; end of response

    CMPI r2, 10           ; newline
    JZ r2, prb_newline

    ; Store char (max 40)
    CMPI r22, 40
    BGE r2, prb_skip
    STORE r21, r2
    ADD r21, r3
    ADDI r22, 1
prb_skip:
    ADD r20, r3
    JMP prb_loop

prb_newline:
    LDI r2, 0
    STORE r21, r2         ; null terminate
    CALL write_line_to_buf
    LDI r3, 1
    LDI r21, SCRATCH
    LDI r22, 0
    ADD r20, r3
    JMP prb_loop

prb_final:
    ; Handle last line if any
    CMPI r22, 0
    JZ r2, prb_ret
    LDI r2, 0
    STORE r21, r2
    CALL write_line_to_buf

prb_ret:
    POP r31
    RET

; =========================================
; WRITE_PROMPT
; =========================================
write_prompt:
    PUSH r31
    LDI r3, 1
    LDI r20, CUR_ROW
    LOAD r4, r20
    LDI r15, COLS
    MUL r4, r15
    LDI r20, BUF
    ADD r20, r4
    LDI r2, 62           ; '>'
    STORE r20, r2
    ADD r20, r3
    LDI r2, 32           ; ' '
    STORE r20, r2
    LDI r20, CUR_COL
    LDI r2, 2
    STORE r20, r2
    POP r31
    RET

; =========================================
; EXTRACT_CMD
; =========================================
extract_cmd:
    PUSH r31
    LDI r3, 1

    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r10, COLS
    MUL r12, r10

    LDI r20, CUR_COL
    LOAD r10, r20

    LDI r20, BUF
    ADD r20, r12
    ADD r20, r3
    ADD r20, r3           ; skip "> "

    LDI r21, SCRATCH
    LDI r22, 2
ec_loop:
    CMP r22, r10
    BGE r2, ec_done
    LOAD r2, r20
    STORE r21, r2
    ADD r20, r3
    ADD r21, r3
    ADD r22, r3
    JMP ec_loop

ec_done:
    LDI r2, 0
    STORE r21, r2
    POP r31
    RET

; =========================================
; WRITE_LINE_TO_BUF
; =========================================
write_line_to_buf:
    PUSH r31
    LDI r3, 1

    LDI r20, CUR_ROW
    LOAD r4, r20
    LDI r15, COLS
    MUL r4, r15
    LDI r20, BUF
    ADD r20, r4

    LDI r21, SCRATCH

wlb_loop:
    LOAD r2, r21
    JZ r2, wlb_done
    STORE r20, r2
    ADD r20, r3
    ADD r21, r3
    JMP wlb_loop

wlb_done:
    CALL do_newline
    POP r31
    RET

; =========================================
; DO_BACKSPACE
; =========================================
do_backspace:
    LDI r3, 1
    LDI r20, CUR_COL
    LOAD r2, r20
    CMPI r2, 2
    JZ r2, hk_ret

    SUBI r2, 1
    STORE r20, r2

    LDI r20, CUR_ROW
    LOAD r4, r20
    LDI r15, COLS
    MUL r4, r15
    LDI r20, CUR_COL
    LOAD r2, r20
    ADD r4, r2
    LDI r20, BUF
    ADD r20, r4
    LDI r2, 32
    STORE r20, r2
    JMP hk_ret

; =========================================
; DO_NEWLINE
; =========================================
do_newline:
    LDI r3, 1
    LDI r20, CUR_COL
    LDI r2, 0
    STORE r20, r2
    LDI r20, CUR_ROW
    LOAD r12, r20
    ADD r12, r3
    CMPI r12, ROWS
    BLT r2, dn_store
    PUSH r31
    CALL scroll_up
    POP r31
    LDI r20, CUR_ROW
    LDI r12, 29
dn_store:
    STORE r20, r12
    RET

; =========================================
; SCROLL_UP
; =========================================
scroll_up:
    PUSH r31
    LDI r3, 1
    LDI r5, 0
scroll_loop:
    CMPI r5, 29
    BGE r2, scroll_clear

    LDI r20, BUF
    LDI r2, 0
    ADD r2, r5
    ADD r2, r3
    LDI r13, COLS
    MUL r2, r13
    ADD r20, r2

    LDI r21, BUF
    LDI r2, 0
    ADD r2, r5
    LDI r13, COLS
    MUL r2, r13
    ADD r21, r2

    LDI r22, 0
scroll_copy:
    LOAD r2, r20
    STORE r21, r2
    ADD r20, r3
    ADD r21, r3
    ADD r22, r3
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r5, r3
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r12, 29
    LDI r13, COLS
    MUL r12, r13
    ADD r20, r12
    LDI r12, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r12
    ADD r20, r3
    ADD r22, r3
    CMPI r22, COLS
    BLT r2, scroll_clr_loop

    POP r31
    RET

; =========================================
; HK_RET -- common return point for handle_key
; =========================================
hk_ret:
    POP r31
    RET
