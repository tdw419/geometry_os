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
;   r8: Result (reserved)
;   r12: Constant 1
;   r9: Key input
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
LDI r12, 1
LDI r30, 0xFD00   ; Stack pointer

; Clear screen
LDI r8, 0x080812
FILL r8

; Clear text buffer to spaces
LDI r20, BUF
LDI r5, 32
clear_buf_init:
    STORE r20, r5
    ADD r20, r12
    CMPI r20, BUF_END
    BLT r8, clear_buf_init

; Init cursor and blink
LDI r20, CUR_COL
LDI r8, 0
STORE r20, r8
LDI r20, CUR_ROW
STORE r20, r8
LDI r20, BLINK
STORE r20, r8

; Title bar
LDI r12, 0
LDI r2, 0
LDI r6, 256
LDI r11, 16
LDI r9, 0x1A0033
RECTF r12, r2, r6, r11, r9

; Title text "Hermes Terminal"
LDI r20, SCRATCH
STRO r20, "Hermes Terminal"
LDI r12, 4
LDI r2, 4
LDI r6, SCRATCH
LDI r11, 0x00FF00  ; green
LDI r9, 0x1A0033  ; match title bar
DRAWTEXT r12, r2, r6, r11, r9

; Close button hit region
LDI r12, 220
LDI r2, 0
LDI r6, 36
LDI r11, 16
HITSET r12, r2, r6, r11, 99

LDI r12, 1

; Welcome messages
LDI r20, SCRATCH
STRO r20, "Hermes Terminal v2.0"
CALL write_line_to_buf
LDI r12, 1
LDI r20, SCRATCH
STRO r20, "Native Agent Bridge Active."
CALL write_line_to_buf
LDI r12, 1

CALL write_prompt
JMP main_loop

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r12, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r8, r20
    ADD r8, r12
    STORE r20, r8

    ; Render
    CALL render

    FRAME

    ; Read key
    IKEY r9
    JZ r9, main_loop

    ; Handle key
    CALL handle_key
    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r12, 1

    ; Clear content area
    LDI r12, 0
    LDI r2, 16
    LDI r6, 256
    LDI r11, 240
    LDI r9, 0x080812
    RECTF r12, r2, r6, r11, r9

    ; Row loop
    LDI r12, 1
    LDI r4, 8            ; CHAR_H
    LDI r3, 6            ; CHAR_W
    LDI r7, 0           ; row counter
    LDI r15, BUF         ; buffer pointer
    LDI r1, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to temporary display scratch
    ; We use 0x6000 as a temporary display scratch to avoid overwriting SCRATCH or RECV_BUF
    LDI r16, 0x6000
    LDI r17, 0
copy_col:
    LOAD r5, r15
    STORE r16, r5
    ADD r15, r12
    ADD r16, r12
    ADD r17, r12
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r8, 0
    STORE r16, r8

    ; Color based on content
    LDI r0, 0xCCCCCC  ; default light gray

    ; Check if row starts with '>' (user prompt) -> green
    LDI r16, 0x6000
    LOAD r5, r16
    CMPI r5, 62         ; '>'
    JNZ r8, render_text_default
    LDI r0, 0x44FF44  ; green for user input
    JMP render_text

render_text_default:
    LDI r0, 0x00FFFF  ; cyan for AI responses

render_text:
    ; DRAWTEXT x=0, y=r1, addr=0x6000, fg=r0, bg=0 (transparent)
    LDI r12, 0
    LDI r13, 0x6000
    LDI r10, 0         ; bg = transparent
    DRAWTEXT r12, r1, r13, r0, r10

    LDI r12, 1

    ADD r1, r4          ; y += 8
    ADD r7, r12          ; row++
    CMPI r7, ROWS
    BLT r7, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r8, r20
    LDI r14, 8
    AND r8, r14
    CMPI r8, 4
    BLT r8, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r8, r20
    MUL r8, r3           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r2, r20
    MUL r2, r4           ; row * 8
    LDI r6, 16
    ADD r2, r6           ; y = 16 + row*8
    LDI r6, 6
    LDI r11, 8
    LDI r9, 0x44FF44
    RECTF r8, r2, r6, r11, r9

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r9 = key
; =========================================
handle_key:
    PUSH r31
    LDI r12, 1

    CMPI r9, 13
    JNZ r8, check_bs
    JMP do_enter

check_bs:
    CMPI r9, 8
    JNZ r8, check_del
    JMP do_backspace

check_del:
    CMPI r9, 127
    JNZ r8, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r2, r20
    LDI r6, COLS
    MUL r2, r6           ; r2 = row * COLS
    LDI r20, CUR_COL
    LOAD r8, r20
    ADD r2, r8           ; r2 = row*COLS + col
    LDI r20, BUF
    ADD r20, r2          ; r20 = BUF + offset
    STORE r20, r9        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r8, r20
    ADD r8, r12
    STORE r20, r8

    ; If col >= COLS, wrap
    CMPI r8, COLS
    JNZ r8, hk_ret
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
    LDI r12, 1
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 47         ; '/'
    JNZ r8, call_hermes_ai  ; not a command, call AI

    ; Check /help
    ADD r20, r12
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r8, try_clear_cmd
    ADD r20, r12
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r8, try_clear_cmd
    ADD r20, r12
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r8, try_clear_cmd
    ADD r20, r12
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r8, try_clear_cmd
    ADD r20, r12
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r8, call_hermes_ai
    JMP cmd_help

try_clear_cmd:
    ; Check /clear
    LDI r20, SCRATCH
    ADD r20, r12           ; skip '/'
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r8, call_hermes_ai
    ADD r20, r12
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r8, call_hermes_ai
    ADD r20, r12
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r8, call_hermes_ai
    ADD r20, r12
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r8, call_hermes_ai
    ADD r20, r12
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r8, call_hermes_ai
    ADD r20, r12
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r8, call_hermes_ai
    JMP cmd_clear

    ; If not a known command, just call AI
    JMP call_hermes_ai

; =========================================
; COMMANDS
; =========================================
cmd_help:
    LDI r12, 1
    LDI r20, SCRATCH
    STRO r20, "/help /clear"
    CALL write_line_to_buf
    LDI r12, 1
    CALL write_prompt
    JMP hk_ret

cmd_clear:
    LDI r12, 1
    ; Clear text buffer to spaces
    LDI r20, BUF
    LDI r5, 32
clear_buf_cmd:
    STORE r20, r5
    ADD r20, r12
    CMPI r20, BUF_END
    BLT r8, clear_buf_cmd
    ; Reset cursor
    LDI r20, CUR_COL
    LDI r8, 0
    STORE r20, r8
    LDI r20, CUR_ROW
    STORE r20, r8
    CALL write_prompt
    JMP hk_ret

; =========================================
; CALL_HERMES_AI
; Call the HERMES opcode and process response
; =========================================
call_hermes_ai:
    LDI r12, 1

    ; Show "thinking" indicator
    LDI r20, SCRATCH
    STRO r20, "..."
    CALL write_line_to_buf
    LDI r12, 1
    CALL render  ; Force render to show "..."
    FRAME

    ; HERMES prompt_addr_reg, response_addr_reg, max_len_reg
    ; prompt is in SCRATCH, we'll put response in RECV_BUF
    LDI r2, SCRATCH
    LDI r6, RECV_BUF
    LDI r11, 2048
    HERMES r2, r6, r11

    ; Remove the "..." line (actually just overwrite it)
    ; We'll scroll up once to clear the "..." before writing response
    ; Wait, write_line_to_buf already advanced the row.
    ; Let's just write the response.

    ; If r8 == 0, something went wrong
    CMPI r8, 0
    JZ r8, hermes_failed

    ; Process the multiline response in RECV_BUF
    CALL process_response_buffer
    JMP call_hermes_done

hermes_failed:
    LDI r20, SCRATCH
    STRO r20, "Agent call failed."
    CALL write_line_to_buf

call_hermes_done:
    LDI r12, 1
    CALL write_prompt
    JMP hk_ret

; =========================================
; PROCESS_RESPONSE_BUFFER
; Split RECV_BUF by newlines and write each line
; =========================================
process_response_buffer:
    PUSH r31
    LDI r12, 1

    LDI r20, RECV_BUF
    LDI r21, SCRATCH      ; build current line into SCRATCH
    LDI r22, 0            ; char count

prb_loop:
    LOAD r8, r20
    JZ r8, prb_final      ; end of response

    CMPI r8, 10           ; newline
    JZ r8, prb_newline

    ; Store char (max 40)
    CMPI r22, 40
    BGE r8, prb_skip
    STORE r21, r8
    ADD r21, r12
    ADDI r22, 1
prb_skip:
    ADD r20, r12
    JMP prb_loop

prb_newline:
    LDI r8, 0
    STORE r21, r8         ; null terminate
    CALL write_line_to_buf
    LDI r12, 1
    LDI r21, SCRATCH
    LDI r22, 0
    ADD r20, r12
    JMP prb_loop

prb_final:
    ; Handle last line if any
    CMPI r22, 0
    JZ r8, prb_ret
    LDI r8, 0
    STORE r21, r8
    CALL write_line_to_buf

prb_ret:
    POP r31
    RET

; =========================================
; WRITE_PROMPT
; =========================================
write_prompt:
    PUSH r31
    LDI r12, 1
    LDI r20, CUR_ROW
    LOAD r2, r20
    LDI r6, COLS
    MUL r2, r6
    LDI r20, BUF
    ADD r20, r2
    LDI r8, 62           ; '>'
    STORE r20, r8
    ADD r20, r12
    LDI r8, 32           ; ' '
    STORE r20, r8
    LDI r20, CUR_COL
    LDI r8, 2
    STORE r20, r8
    POP r31
    RET

; =========================================
; EXTRACT_CMD
; =========================================
extract_cmd:
    PUSH r31
    LDI r12, 1

    LDI r20, CUR_ROW
    LOAD r5, r20
    LDI r14, COLS
    MUL r5, r14

    LDI r20, CUR_COL
    LOAD r14, r20

    LDI r20, BUF
    ADD r20, r5
    ADD r20, r12
    ADD r20, r12           ; skip "> "

    LDI r21, SCRATCH
    LDI r22, 2
ec_loop:
    CMP r22, r14
    BGE r8, ec_done
    LOAD r8, r20
    STORE r21, r8
    ADD r20, r12
    ADD r21, r12
    ADD r22, r12
    JMP ec_loop

ec_done:
    LDI r8, 0
    STORE r21, r8
    POP r31
    RET

; =========================================
; WRITE_LINE_TO_BUF
; =========================================
write_line_to_buf:
    PUSH r31
    LDI r12, 1

    LDI r20, CUR_ROW
    LOAD r2, r20
    LDI r6, COLS
    MUL r2, r6
    LDI r20, BUF
    ADD r20, r2

    LDI r21, SCRATCH

wlb_loop:
    LOAD r8, r21
    JZ r8, wlb_done
    STORE r20, r8
    ADD r20, r12
    ADD r21, r12
    JMP wlb_loop

wlb_done:
    CALL do_newline
    POP r31
    RET

; =========================================
; DO_BACKSPACE
; =========================================
do_backspace:
    LDI r12, 1
    LDI r20, CUR_COL
    LOAD r8, r20
    CMPI r8, 2
    JZ r8, hk_ret

    SUBI r8, 1
    STORE r20, r8

    LDI r20, CUR_ROW
    LOAD r2, r20
    LDI r6, COLS
    MUL r2, r6
    LDI r20, CUR_COL
    LOAD r8, r20
    ADD r2, r8
    LDI r20, BUF
    ADD r20, r2
    LDI r8, 32
    STORE r20, r8
    JMP hk_ret

; =========================================
; DO_NEWLINE
; =========================================
do_newline:
    LDI r12, 1
    LDI r20, CUR_COL
    LDI r8, 0
    STORE r20, r8
    LDI r20, CUR_ROW
    LOAD r5, r20
    ADD r5, r12
    CMPI r5, ROWS
    BLT r8, dn_store
    PUSH r31
    CALL scroll_up
    POP r31
    LDI r20, CUR_ROW
    LDI r5, 29
dn_store:
    STORE r20, r5
    RET

; =========================================
; SCROLL_UP
; =========================================
scroll_up:
    PUSH r31
    LDI r12, 1
    LDI r7, 0
scroll_loop:
    CMPI r7, 29
    BGE r8, scroll_clear

    LDI r20, BUF
    LDI r8, 0
    ADD r8, r7
    ADD r8, r12
    LDI r15, COLS
    MUL r8, r15
    ADD r20, r8

    LDI r21, BUF
    LDI r8, 0
    ADD r8, r7
    LDI r15, COLS
    MUL r8, r15
    ADD r21, r8

    LDI r22, 0
scroll_copy:
    LOAD r8, r20
    STORE r21, r8
    ADD r20, r12
    ADD r21, r12
    ADD r22, r12
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r7, r12
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r5, 29
    LDI r15, COLS
    MUL r5, r15
    ADD r20, r5
    LDI r5, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r5
    ADD r20, r12
    ADD r22, r12
    CMPI r22, COLS
    BLT r8, scroll_clr_loop

    POP r31
    RET

; =========================================
; HK_RET -- common return point for handle_key
; =========================================
hk_ret:
    POP r31
    RET
