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
;   r7: Result (reserved)
;   r1: Constant 1
;   r13: Key input
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
LDI r1, 1
LDI r30, 0xFD00   ; Stack pointer

; Clear screen
LDI r7, 0x080812
FILL r7

; Clear text buffer to spaces
LDI r20, BUF
LDI r10, 32
clear_buf_init:
    STORE r20, r10
    ADD r20, r1
    CMPI r20, BUF_END
    BLT r7, clear_buf_init

; Init cursor and blink
LDI r20, CUR_COL
LDI r7, 0
STORE r20, r7
LDI r20, CUR_ROW
STORE r20, r7
LDI r20, BLINK
STORE r20, r7

; Title bar
LDI r1, 0
LDI r12, 0
LDI r9, 256
LDI r8, 16
LDI r13, 0x1A0033
RECTF r1, r12, r9, r8, r13

; Title text "Hermes Terminal"
LDI r20, SCRATCH
STRO r20, "Hermes Terminal"
LDI r1, 4
LDI r12, 4
LDI r9, SCRATCH
LDI r8, 0x00FF00  ; green
LDI r13, 0x1A0033  ; match title bar
DRAWTEXT r1, r12, r9, r8, r13

; Close button hit region
LDI r1, 220
LDI r12, 0
LDI r9, 36
LDI r8, 16
HITSET r1, r12, r9, r8, 99

LDI r1, 1

; Welcome messages
LDI r20, SCRATCH
STRO r20, "Hermes Terminal v2.0"
CALL write_line_to_buf
LDI r1, 1
LDI r20, SCRATCH
STRO r20, "Native Agent Bridge Active."
CALL write_line_to_buf
LDI r1, 1

CALL write_prompt
JMP main_loop

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r1, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r7, r20
    ADD r7, r1
    STORE r20, r7

    ; Render
    CALL render

    FRAME

    ; Read key
    IKEY r13
    JZ r13, main_loop

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
    LDI r12, 16
    LDI r9, 256
    LDI r8, 240
    LDI r13, 0x080812
    RECTF r1, r12, r9, r8, r13

    ; Row loop
    LDI r1, 1
    LDI r0, 8            ; CHAR_H
    LDI r5, 6            ; CHAR_W
    LDI r3, 0           ; row counter
    LDI r4, BUF         ; buffer pointer
    LDI r11, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to temporary display scratch
    ; We use 0x6000 as a temporary display scratch to avoid overwriting SCRATCH or RECV_BUF
    LDI r16, 0x6000
    LDI r17, 0
copy_col:
    LOAD r10, r4
    STORE r16, r10
    ADD r4, r1
    ADD r16, r1
    ADD r17, r1
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r7, 0
    STORE r16, r7

    ; Color based on content
    LDI r6, 0xCCCCCC  ; default light gray

    ; Check if row starts with '>' (user prompt) -> green
    LDI r16, 0x6000
    LOAD r10, r16
    CMPI r10, 62         ; '>'
    JNZ r7, render_text_default
    LDI r6, 0x44FF44  ; green for user input
    JMP render_text

render_text_default:
    LDI r6, 0x00FFFF  ; cyan for AI responses

render_text:
    ; DRAWTEXT x=0, y=r11, addr=0x6000, fg=r6, bg=0 (transparent)
    LDI r1, 0
    LDI r15, 0x6000
    LDI r14, 0         ; bg = transparent
    DRAWTEXT r1, r11, r15, r6, r14

    LDI r1, 1

    ADD r11, r0          ; y += 8
    ADD r3, r1          ; row++
    CMPI r3, ROWS
    BLT r3, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r7, r20
    LDI r2, 8
    AND r7, r2
    CMPI r7, 4
    BLT r7, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r7, r20
    MUL r7, r5           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r12, r20
    MUL r12, r0           ; row * 8
    LDI r9, 16
    ADD r12, r9           ; y = 16 + row*8
    LDI r9, 6
    LDI r8, 8
    LDI r13, 0x44FF44
    RECTF r7, r12, r9, r8, r13

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r13 = key
; =========================================
handle_key:
    PUSH r31
    LDI r1, 1

    CMPI r13, 13
    JNZ r7, check_bs
    JMP do_enter

check_bs:
    CMPI r13, 8
    JNZ r7, check_del
    JMP do_backspace

check_del:
    CMPI r13, 127
    JNZ r7, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r9, COLS
    MUL r12, r9           ; r12 = row * COLS
    LDI r20, CUR_COL
    LOAD r7, r20
    ADD r12, r7           ; r12 = row*COLS + col
    LDI r20, BUF
    ADD r20, r12          ; r20 = BUF + offset
    STORE r20, r13        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r7, r20
    ADD r7, r1
    STORE r20, r7

    ; If col >= COLS, wrap
    CMPI r7, COLS
    JNZ r7, hk_ret
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
    LDI r1, 1
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 47         ; '/'
    JNZ r7, call_hermes_ai  ; not a command, call AI

    ; Check /help
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r7, try_clear_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r7, try_clear_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r7, try_clear_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r7, try_clear_cmd
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r7, call_hermes_ai
    JMP cmd_help

try_clear_cmd:
    ; Check /clear
    LDI r20, SCRATCH
    ADD r20, r1           ; skip '/'
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r7, call_hermes_ai
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r7, call_hermes_ai
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r7, call_hermes_ai
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r7, call_hermes_ai
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r7, call_hermes_ai
    ADD r20, r1
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r7, call_hermes_ai
    JMP cmd_clear

    ; If not a known command, just call AI
    JMP call_hermes_ai

; =========================================
; COMMANDS
; =========================================
cmd_help:
    LDI r1, 1
    LDI r20, SCRATCH
    STRO r20, "/help /clear"
    CALL write_line_to_buf
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

cmd_clear:
    LDI r1, 1
    ; Clear text buffer to spaces
    LDI r20, BUF
    LDI r10, 32
clear_buf_cmd:
    STORE r20, r10
    ADD r20, r1
    CMPI r20, BUF_END
    BLT r7, clear_buf_cmd
    ; Reset cursor
    LDI r20, CUR_COL
    LDI r7, 0
    STORE r20, r7
    LDI r20, CUR_ROW
    STORE r20, r7
    CALL write_prompt
    JMP hk_ret

; =========================================
; CALL_HERMES_AI
; Call the HERMES opcode and process response
; =========================================
call_hermes_ai:
    LDI r1, 1

    ; Show "thinking" indicator
    LDI r20, SCRATCH
    STRO r20, "..."
    CALL write_line_to_buf
    LDI r1, 1
    CALL render  ; Force render to show "..."
    FRAME

    ; HERMES prompt_addr_reg, response_addr_reg, max_len_reg
    ; prompt is in SCRATCH, we'll put response in RECV_BUF
    LDI r12, SCRATCH
    LDI r9, RECV_BUF
    LDI r8, 2048
    HERMES r12, r9, r8

    ; Remove the "..." line (actually just overwrite it)
    ; We'll scroll up once to clear the "..." before writing response
    ; Wait, write_line_to_buf already advanced the row.
    ; Let's just write the response.

    ; If r7 == 0, something went wrong
    CMPI r7, 0
    JZ r7, hermes_failed

    ; Process the multiline response in RECV_BUF
    CALL process_response_buffer
    JMP call_hermes_done

hermes_failed:
    LDI r20, SCRATCH
    STRO r20, "Agent call failed."
    CALL write_line_to_buf

call_hermes_done:
    LDI r1, 1
    CALL write_prompt
    JMP hk_ret

; =========================================
; PROCESS_RESPONSE_BUFFER
; Split RECV_BUF by newlines and write each line
; =========================================
process_response_buffer:
    PUSH r31
    LDI r1, 1

    LDI r20, RECV_BUF
    LDI r21, SCRATCH      ; build current line into SCRATCH
    LDI r22, 0            ; char count

prb_loop:
    LOAD r7, r20
    JZ r7, prb_final      ; end of response

    CMPI r7, 10           ; newline
    JZ r7, prb_newline

    ; Store char (max 40)
    CMPI r22, 40
    BGE r7, prb_skip
    STORE r21, r7
    ADD r21, r1
    ADDI r22, 1
prb_skip:
    ADD r20, r1
    JMP prb_loop

prb_newline:
    LDI r7, 0
    STORE r21, r7         ; null terminate
    CALL write_line_to_buf
    LDI r1, 1
    LDI r21, SCRATCH
    LDI r22, 0
    ADD r20, r1
    JMP prb_loop

prb_final:
    ; Handle last line if any
    CMPI r22, 0
    JZ r7, prb_ret
    LDI r7, 0
    STORE r21, r7
    CALL write_line_to_buf

prb_ret:
    POP r31
    RET

; =========================================
; WRITE_PROMPT
; =========================================
write_prompt:
    PUSH r31
    LDI r1, 1
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r9, COLS
    MUL r12, r9
    LDI r20, BUF
    ADD r20, r12
    LDI r7, 62           ; '>'
    STORE r20, r7
    ADD r20, r1
    LDI r7, 32           ; ' '
    STORE r20, r7
    LDI r20, CUR_COL
    LDI r7, 2
    STORE r20, r7
    POP r31
    RET

; =========================================
; EXTRACT_CMD
; =========================================
extract_cmd:
    PUSH r31
    LDI r1, 1

    LDI r20, CUR_ROW
    LOAD r10, r20
    LDI r2, COLS
    MUL r10, r2

    LDI r20, CUR_COL
    LOAD r2, r20

    LDI r20, BUF
    ADD r20, r10
    ADD r20, r1
    ADD r20, r1           ; skip "> "

    LDI r21, SCRATCH
    LDI r22, 2
ec_loop:
    CMP r22, r2
    BGE r7, ec_done
    LOAD r7, r20
    STORE r21, r7
    ADD r20, r1
    ADD r21, r1
    ADD r22, r1
    JMP ec_loop

ec_done:
    LDI r7, 0
    STORE r21, r7
    POP r31
    RET

; =========================================
; WRITE_LINE_TO_BUF
; =========================================
write_line_to_buf:
    PUSH r31
    LDI r1, 1

    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r9, COLS
    MUL r12, r9
    LDI r20, BUF
    ADD r20, r12

    LDI r21, SCRATCH

wlb_loop:
    LOAD r7, r21
    JZ r7, wlb_done
    STORE r20, r7
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
    LDI r1, 1
    LDI r20, CUR_COL
    LOAD r7, r20
    CMPI r7, 2
    JZ r7, hk_ret

    SUBI r7, 1
    STORE r20, r7

    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r9, COLS
    MUL r12, r9
    LDI r20, CUR_COL
    LOAD r7, r20
    ADD r12, r7
    LDI r20, BUF
    ADD r20, r12
    LDI r7, 32
    STORE r20, r7
    JMP hk_ret

; =========================================
; DO_NEWLINE
; =========================================
do_newline:
    LDI r1, 1
    LDI r20, CUR_COL
    LDI r7, 0
    STORE r20, r7
    LDI r20, CUR_ROW
    LOAD r10, r20
    ADD r10, r1
    CMPI r10, ROWS
    BLT r7, dn_store
    PUSH r31
    CALL scroll_up
    POP r31
    LDI r20, CUR_ROW
    LDI r10, 29
dn_store:
    STORE r20, r10
    RET

; =========================================
; SCROLL_UP
; =========================================
scroll_up:
    PUSH r31
    LDI r1, 1
    LDI r3, 0
scroll_loop:
    CMPI r3, 29
    BGE r7, scroll_clear

    LDI r20, BUF
    LDI r7, 0
    ADD r7, r3
    ADD r7, r1
    LDI r4, COLS
    MUL r7, r4
    ADD r20, r7

    LDI r21, BUF
    LDI r7, 0
    ADD r7, r3
    LDI r4, COLS
    MUL r7, r4
    ADD r21, r7

    LDI r22, 0
scroll_copy:
    LOAD r7, r20
    STORE r21, r7
    ADD r20, r1
    ADD r21, r1
    ADD r22, r1
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r3, r1
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r10, 29
    LDI r4, COLS
    MUL r10, r4
    ADD r20, r10
    LDI r10, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r10
    ADD r20, r1
    ADD r22, r1
    CMPI r22, COLS
    BLT r7, scroll_clr_loop

    POP r31
    RET

; =========================================
; HK_RET -- common return point for handle_key
; =========================================
hk_ret:
    POP r31
    RET
