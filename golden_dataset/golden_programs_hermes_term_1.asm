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
;   r11: Result (reserved)
;   r15: Constant 1
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
LDI r15, 1
LDI r30, 0xFD00   ; Stack pointer

; Clear screen
LDI r11, 0x080812
FILL r11

; Clear text buffer to spaces
LDI r20, BUF
LDI r2, 32
clear_buf_init:
    STORE r20, r2
    ADD r20, r15
    CMPI r20, BUF_END
    BLT r11, clear_buf_init

; Init cursor and blink
LDI r20, CUR_COL
LDI r11, 0
STORE r20, r11
LDI r20, CUR_ROW
STORE r20, r11
LDI r20, BLINK
STORE r20, r11

; Title bar
LDI r15, 0
LDI r10, 0
LDI r9, 256
LDI r14, 16
LDI r13, 0x1A0033
RECTF r15, r10, r9, r14, r13

; Title text "Hermes Terminal"
LDI r20, SCRATCH
STRO r20, "Hermes Terminal"
LDI r15, 4
LDI r10, 4
LDI r9, SCRATCH
LDI r14, 0x00FF00  ; green
LDI r13, 0x1A0033  ; match title bar
DRAWTEXT r15, r10, r9, r14, r13

; Close button hit region
LDI r15, 220
LDI r10, 0
LDI r9, 36
LDI r14, 16
HITSET r15, r10, r9, r14, 99

LDI r15, 1

; Welcome messages
LDI r20, SCRATCH
STRO r20, "Hermes Terminal v2.0"
CALL write_line_to_buf
LDI r15, 1
LDI r20, SCRATCH
STRO r20, "Native Agent Bridge Active."
CALL write_line_to_buf
LDI r15, 1

CALL write_prompt
JMP main_loop

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r15, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r11, r20
    ADD r11, r15
    STORE r20, r11

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
    LDI r15, 1

    ; Clear content area
    LDI r15, 0
    LDI r10, 16
    LDI r9, 256
    LDI r14, 240
    LDI r13, 0x080812
    RECTF r15, r10, r9, r14, r13

    ; Row loop
    LDI r15, 1
    LDI r7, 8            ; CHAR_H
    LDI r5, 6            ; CHAR_W
    LDI r0, 0           ; row counter
    LDI r4, BUF         ; buffer pointer
    LDI r6, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to temporary display scratch
    ; We use 0x6000 as a temporary display scratch to avoid overwriting SCRATCH or RECV_BUF
    LDI r16, 0x6000
    LDI r17, 0
copy_col:
    LOAD r2, r4
    STORE r16, r2
    ADD r4, r15
    ADD r16, r15
    ADD r17, r15
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r11, 0
    STORE r16, r11

    ; Color based on content
    LDI r12, 0xCCCCCC  ; default light gray

    ; Check if row starts with '>' (user prompt) -> green
    LDI r16, 0x6000
    LOAD r2, r16
    CMPI r2, 62         ; '>'
    JNZ r11, render_text_default
    LDI r12, 0x44FF44  ; green for user input
    JMP render_text

render_text_default:
    LDI r12, 0x00FFFF  ; cyan for AI responses

render_text:
    ; DRAWTEXT x=0, y=r6, addr=0x6000, fg=r12, bg=0 (transparent)
    LDI r15, 0
    LDI r1, 0x6000
    LDI r8, 0         ; bg = transparent
    DRAWTEXT r15, r6, r1, r12, r8

    LDI r15, 1

    ADD r6, r7          ; y += 8
    ADD r0, r15          ; row++
    CMPI r0, ROWS
    BLT r0, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r11, r20
    LDI r3, 8
    AND r11, r3
    CMPI r11, 4
    BLT r11, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r11, r20
    MUL r11, r5           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r10, r20
    MUL r10, r7           ; row * 8
    LDI r9, 16
    ADD r10, r9           ; y = 16 + row*8
    LDI r9, 6
    LDI r14, 8
    LDI r13, 0x44FF44
    RECTF r11, r10, r9, r14, r13

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r13 = key
; =========================================
handle_key:
    PUSH r31
    LDI r15, 1

    CMPI r13, 13
    JNZ r11, check_bs
    JMP do_enter

check_bs:
    CMPI r13, 8
    JNZ r11, check_del
    JMP do_backspace

check_del:
    CMPI r13, 127
    JNZ r11, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r10, r20
    LDI r9, COLS
    MUL r10, r9           ; r10 = row * COLS
    LDI r20, CUR_COL
    LOAD r11, r20
    ADD r10, r11           ; r10 = row*COLS + col
    LDI r20, BUF
    ADD r20, r10          ; r20 = BUF + offset
    STORE r20, r13        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r11, r20
    ADD r11, r15
    STORE r20, r11

    ; If col >= COLS, wrap
    CMPI r11, COLS
    JNZ r11, hk_ret
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
    LDI r15, 1
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 47         ; '/'
    JNZ r11, call_hermes_ai  ; not a command, call AI

    ; Check /help
    ADD r20, r15
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r11, try_clear_cmd
    ADD r20, r15
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r11, try_clear_cmd
    ADD r20, r15
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r11, try_clear_cmd
    ADD r20, r15
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r11, try_clear_cmd
    ADD r20, r15
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r11, call_hermes_ai
    JMP cmd_help

try_clear_cmd:
    ; Check /clear
    LDI r20, SCRATCH
    ADD r20, r15           ; skip '/'
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r11, call_hermes_ai
    ADD r20, r15
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r11, call_hermes_ai
    ADD r20, r15
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r11, call_hermes_ai
    ADD r20, r15
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r11, call_hermes_ai
    ADD r20, r15
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r11, call_hermes_ai
    ADD r20, r15
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r11, call_hermes_ai
    JMP cmd_clear

    ; If not a known command, just call AI
    JMP call_hermes_ai

; =========================================
; COMMANDS
; =========================================
cmd_help:
    LDI r15, 1
    LDI r20, SCRATCH
    STRO r20, "/help /clear"
    CALL write_line_to_buf
    LDI r15, 1
    CALL write_prompt
    JMP hk_ret

cmd_clear:
    LDI r15, 1
    ; Clear text buffer to spaces
    LDI r20, BUF
    LDI r2, 32
clear_buf_cmd:
    STORE r20, r2
    ADD r20, r15
    CMPI r20, BUF_END
    BLT r11, clear_buf_cmd
    ; Reset cursor
    LDI r20, CUR_COL
    LDI r11, 0
    STORE r20, r11
    LDI r20, CUR_ROW
    STORE r20, r11
    CALL write_prompt
    JMP hk_ret

; =========================================
; CALL_HERMES_AI
; Call the HERMES opcode and process response
; =========================================
call_hermes_ai:
    LDI r15, 1

    ; Show "thinking" indicator
    LDI r20, SCRATCH
    STRO r20, "..."
    CALL write_line_to_buf
    LDI r15, 1
    CALL render  ; Force render to show "..."
    FRAME

    ; HERMES prompt_addr_reg, response_addr_reg, max_len_reg
    ; prompt is in SCRATCH, we'll put response in RECV_BUF
    LDI r10, SCRATCH
    LDI r9, RECV_BUF
    LDI r14, 2048
    HERMES r10, r9, r14

    ; Remove the "..." line (actually just overwrite it)
    ; We'll scroll up once to clear the "..." before writing response
    ; Wait, write_line_to_buf already advanced the row.
    ; Let's just write the response.

    ; If r11 == 0, something went wrong
    CMPI r11, 0
    JZ r11, hermes_failed

    ; Process the multiline response in RECV_BUF
    CALL process_response_buffer
    JMP call_hermes_done

hermes_failed:
    LDI r20, SCRATCH
    STRO r20, "Agent call failed."
    CALL write_line_to_buf

call_hermes_done:
    LDI r15, 1
    CALL write_prompt
    JMP hk_ret

; =========================================
; PROCESS_RESPONSE_BUFFER
; Split RECV_BUF by newlines and write each line
; =========================================
process_response_buffer:
    PUSH r31
    LDI r15, 1

    LDI r20, RECV_BUF
    LDI r21, SCRATCH      ; build current line into SCRATCH
    LDI r22, 0            ; char count

prb_loop:
    LOAD r11, r20
    JZ r11, prb_final      ; end of response

    CMPI r11, 10           ; newline
    JZ r11, prb_newline

    ; Store char (max 40)
    CMPI r22, 40
    BGE r11, prb_skip
    STORE r21, r11
    ADD r21, r15
    ADDI r22, 1
prb_skip:
    ADD r20, r15
    JMP prb_loop

prb_newline:
    LDI r11, 0
    STORE r21, r11         ; null terminate
    CALL write_line_to_buf
    LDI r15, 1
    LDI r21, SCRATCH
    LDI r22, 0
    ADD r20, r15
    JMP prb_loop

prb_final:
    ; Handle last line if any
    CMPI r22, 0
    JZ r11, prb_ret
    LDI r11, 0
    STORE r21, r11
    CALL write_line_to_buf

prb_ret:
    POP r31
    RET

; =========================================
; WRITE_PROMPT
; =========================================
write_prompt:
    PUSH r31
    LDI r15, 1
    LDI r20, CUR_ROW
    LOAD r10, r20
    LDI r9, COLS
    MUL r10, r9
    LDI r20, BUF
    ADD r20, r10
    LDI r11, 62           ; '>'
    STORE r20, r11
    ADD r20, r15
    LDI r11, 32           ; ' '
    STORE r20, r11
    LDI r20, CUR_COL
    LDI r11, 2
    STORE r20, r11
    POP r31
    RET

; =========================================
; EXTRACT_CMD
; =========================================
extract_cmd:
    PUSH r31
    LDI r15, 1

    LDI r20, CUR_ROW
    LOAD r2, r20
    LDI r3, COLS
    MUL r2, r3

    LDI r20, CUR_COL
    LOAD r3, r20

    LDI r20, BUF
    ADD r20, r2
    ADD r20, r15
    ADD r20, r15           ; skip "> "

    LDI r21, SCRATCH
    LDI r22, 2
ec_loop:
    CMP r22, r3
    BGE r11, ec_done
    LOAD r11, r20
    STORE r21, r11
    ADD r20, r15
    ADD r21, r15
    ADD r22, r15
    JMP ec_loop

ec_done:
    LDI r11, 0
    STORE r21, r11
    POP r31
    RET

; =========================================
; WRITE_LINE_TO_BUF
; =========================================
write_line_to_buf:
    PUSH r31
    LDI r15, 1

    LDI r20, CUR_ROW
    LOAD r10, r20
    LDI r9, COLS
    MUL r10, r9
    LDI r20, BUF
    ADD r20, r10

    LDI r21, SCRATCH

wlb_loop:
    LOAD r11, r21
    JZ r11, wlb_done
    STORE r20, r11
    ADD r20, r15
    ADD r21, r15
    JMP wlb_loop

wlb_done:
    CALL do_newline
    POP r31
    RET

; =========================================
; DO_BACKSPACE
; =========================================
do_backspace:
    LDI r15, 1
    LDI r20, CUR_COL
    LOAD r11, r20
    CMPI r11, 2
    JZ r11, hk_ret

    SUBI r11, 1
    STORE r20, r11

    LDI r20, CUR_ROW
    LOAD r10, r20
    LDI r9, COLS
    MUL r10, r9
    LDI r20, CUR_COL
    LOAD r11, r20
    ADD r10, r11
    LDI r20, BUF
    ADD r20, r10
    LDI r11, 32
    STORE r20, r11
    JMP hk_ret

; =========================================
; DO_NEWLINE
; =========================================
do_newline:
    LDI r15, 1
    LDI r20, CUR_COL
    LDI r11, 0
    STORE r20, r11
    LDI r20, CUR_ROW
    LOAD r2, r20
    ADD r2, r15
    CMPI r2, ROWS
    BLT r11, dn_store
    PUSH r31
    CALL scroll_up
    POP r31
    LDI r20, CUR_ROW
    LDI r2, 29
dn_store:
    STORE r20, r2
    RET

; =========================================
; SCROLL_UP
; =========================================
scroll_up:
    PUSH r31
    LDI r15, 1
    LDI r0, 0
scroll_loop:
    CMPI r0, 29
    BGE r11, scroll_clear

    LDI r20, BUF
    LDI r11, 0
    ADD r11, r0
    ADD r11, r15
    LDI r4, COLS
    MUL r11, r4
    ADD r20, r11

    LDI r21, BUF
    LDI r11, 0
    ADD r11, r0
    LDI r4, COLS
    MUL r11, r4
    ADD r21, r11

    LDI r22, 0
scroll_copy:
    LOAD r11, r20
    STORE r21, r11
    ADD r20, r15
    ADD r21, r15
    ADD r22, r15
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r0, r15
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r2, 29
    LDI r4, COLS
    MUL r2, r4
    ADD r20, r2
    LDI r2, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r2
    ADD r20, r15
    ADD r22, r15
    CMPI r22, COLS
    BLT r11, scroll_clr_loop

    POP r31
    RET

; =========================================
; HK_RET -- common return point for handle_key
; =========================================
hk_ret:
    POP r31
    RET
