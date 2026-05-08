; DESCRIPTION: Geometry OS program to draw a red line.

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
;   r10: Constant 1
;   r6: Key input
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
LDI r10, 1
LDI r30, 0xFD00   ; Stack pointer

; Clear screen
LDI r8, 0x080812
FILL r8

; Clear text buffer to spaces
LDI r20, BUF
LDI r4, 32
clear_buf_init:
    STORE r20, r4
    ADD r20, r10
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
LDI r10, 0
LDI r9, 0
LDI r1, 256
LDI r2, 16
LDI r6, 0x1A0033
RECTF r10, r9, r1, r2, r6

; Title text "Hermes Terminal"
LDI r20, SCRATCH
STRO r20, "Hermes Terminal"
LDI r10, 4
LDI r9, 4
LDI r1, SCRATCH
LDI r2, 0x00FF00  ; green
LDI r6, 0x1A0033  ; match title bar
DRAWTEXT r10, r9, r1, r2, r6

; Close button hit region
LDI r10, 220
LDI r9, 0
LDI r1, 36
LDI r2, 16
HITSET r10, r9, r1, r2, 99

LDI r10, 1

; Welcome messages
LDI r20, SCRATCH
STRO r20, "Hermes Terminal v2.0"
CALL write_line_to_buf
LDI r10, 1
LDI r20, SCRATCH
STRO r20, "Native Agent Bridge Active."
CALL write_line_to_buf
LDI r10, 1

CALL write_prompt
JMP main_loop

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r10, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r8, r20
    ADD r8, r10
    STORE r20, r8

    ; Render
    CALL render

    FRAME

    ; Read key
    IKEY r6
    JZ r6, main_loop

    ; Handle key
    CALL handle_key
    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r10, 1

    ; Clear content area
    LDI r10, 0
    LDI r9, 16
    LDI r1, 256
    LDI r2, 240
    LDI r6, 0x080812
    RECTF r10, r9, r1, r2, r6

    ; Row loop
    LDI r10, 1
    LDI r11, 8            ; CHAR_H
    LDI r15, 6            ; CHAR_W
    LDI r14, 0           ; row counter
    LDI r3, BUF         ; buffer pointer
    LDI r7, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to temporary display scratch
    ; We use 0x6000 as a temporary display scratch to avoid overwriting SCRATCH or RECV_BUF
    LDI r16, 0x6000
    LDI r17, 0
copy_col:
    LOAD r4, r3
    STORE r16, r4
    ADD r3, r10
    ADD r16, r10
    ADD r17, r10
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r8, 0
    STORE r16, r8

    ; Color based on content
    LDI r0, 0xCCCCCC  ; default light gray

    ; Check if row starts with '>' (user prompt) -> green
    LDI r16, 0x6000
    LOAD r4, r16
    CMPI r4, 62         ; '>'
    JNZ r8, render_text_default
    LDI r0, 0x44FF44  ; green for user input
    JMP render_text

render_text_default:
    LDI r0, 0x00FFFF  ; cyan for AI responses

render_text:
    ; DRAWTEXT x=0, y=r7, addr=0x6000, fg=r0, bg=0 (transparent)
    LDI r10, 0
    LDI r13, 0x6000
    LDI r12, 0         ; bg = transparent
    DRAWTEXT r10, r7, r13, r0, r12

    LDI r10, 1

    ADD r7, r11          ; y += 8
    ADD r14, r10          ; row++
    CMPI r14, ROWS
    BLT r14, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r8, r20
    LDI r5, 8
    AND r8, r5
    CMPI r8, 4
    BLT r8, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r8, r20
    MUL r8, r15           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r9, r20
    MUL r9, r11           ; row * 8
    LDI r1, 16
    ADD r9, r1           ; y = 16 + row*8
    LDI r1, 6
    LDI r2, 8
    LDI r6, 0x44FF44
    RECTF r8, r9, r1, r2, r6

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r6 = key
; =========================================
handle_key:
    PUSH r31
    LDI r10, 1

    CMPI r6, 13
    JNZ r8, check_bs
    JMP do_enter

check_bs:
    CMPI r6, 8
    JNZ r8, check_del
    JMP do_backspace

check_del:
    CMPI r6, 127
    JNZ r8, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r1, COLS
    MUL r9, r1           ; r9 = row * COLS
    LDI r20, CUR_COL
    LOAD r8, r20
    ADD r9, r8           ; r9 = row*COLS + col
    LDI r20, BUF
    ADD r20, r9          ; r20 = BUF + offset
    STORE r20, r6        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r8, r20
    ADD r8, r10
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
    LDI r10, 1
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 47         ; '/'
    JNZ r8, call_hermes_ai  ; not a command, call AI

    ; Check /help
    ADD r20, r10
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r8, try_clear_cmd
    ADD r20, r10
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r8, try_clear_cmd
    ADD r20, r10
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r8, try_clear_cmd
    ADD r20, r10
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r8, try_clear_cmd
    ADD r20, r10
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r8, call_hermes_ai
    JMP cmd_help

try_clear_cmd:
    ; Check /clear
    LDI r20, SCRATCH
    ADD r20, r10           ; skip '/'
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r8, call_hermes_ai
    ADD r20, r10
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r8, call_hermes_ai
    ADD r20, r10
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r8, call_hermes_ai
    ADD r20, r10
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r8, call_hermes_ai
    ADD r20, r10
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r8, call_hermes_ai
    ADD r20, r10
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
    LDI r10, 1
    LDI r20, SCRATCH
    STRO r20, "/help /clear"
    CALL write_line_to_buf
    LDI r10, 1
    CALL write_prompt
    JMP hk_ret

cmd_clear:
    LDI r10, 1
    ; Clear text buffer to spaces
    LDI r20, BUF
    LDI r4, 32
clear_buf_cmd:
    STORE r20, r4
    ADD r20, r10
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
    LDI r10, 1

    ; Show "thinking" indicator
    LDI r20, SCRATCH
    STRO r20, "..."
    CALL write_line_to_buf
    LDI r10, 1
    CALL render  ; Force render to show "..."
    FRAME

    ; HERMES prompt_addr_reg, response_addr_reg, max_len_reg
    ; prompt is in SCRATCH, we'll put response in RECV_BUF
    LDI r9, SCRATCH
    LDI r1, RECV_BUF
    LDI r2, 2048
    HERMES r9, r1, r2

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
    LDI r10, 1
    CALL write_prompt
    JMP hk_ret

; =========================================
; PROCESS_RESPONSE_BUFFER
; Split RECV_BUF by newlines and write each line
; =========================================
process_response_buffer:
    PUSH r31
    LDI r10, 1

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
    ADD r21, r10
    ADDI r22, 1
prb_skip:
    ADD r20, r10
    JMP prb_loop

prb_newline:
    LDI r8, 0
    STORE r21, r8         ; null terminate
    CALL write_line_to_buf
    LDI r10, 1
    LDI r21, SCRATCH
    LDI r22, 0
    ADD r20, r10
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
    LDI r10, 1
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r1, COLS
    MUL r9, r1
    LDI r20, BUF
    ADD r20, r9
    LDI r8, 62           ; '>'
    STORE r20, r8
    ADD r20, r10
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
    LDI r10, 1

    LDI r20, CUR_ROW
    LOAD r4, r20
    LDI r5, COLS
    MUL r4, r5

    LDI r20, CUR_COL
    LOAD r5, r20

    LDI r20, BUF
    ADD r20, r4
    ADD r20, r10
    ADD r20, r10           ; skip "> "

    LDI r21, SCRATCH
    LDI r22, 2
ec_loop:
    CMP r22, r5
    BGE r8, ec_done
    LOAD r8, r20
    STORE r21, r8
    ADD r20, r10
    ADD r21, r10
    ADD r22, r10
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
    LDI r10, 1

    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r1, COLS
    MUL r9, r1
    LDI r20, BUF
    ADD r20, r9

    LDI r21, SCRATCH

wlb_loop:
    LOAD r8, r21
    JZ r8, wlb_done
    STORE r20, r8
    ADD r20, r10
    ADD r21, r10
    JMP wlb_loop

wlb_done:
    CALL do_newline
    POP r31
    RET

; =========================================
; DO_BACKSPACE
; =========================================
do_backspace:
    LDI r10, 1
    LDI r20, CUR_COL
    LOAD r8, r20
    CMPI r8, 2
    JZ r8, hk_ret

    SUBI r8, 1
    STORE r20, r8

    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r1, COLS
    MUL r9, r1
    LDI r20, CUR_COL
    LOAD r8, r20
    ADD r9, r8
    LDI r20, BUF
    ADD r20, r9
    LDI r8, 32
    STORE r20, r8
    JMP hk_ret

; =========================================
; DO_NEWLINE
; =========================================
do_newline:
    LDI r10, 1
    LDI r20, CUR_COL
    LDI r8, 0
    STORE r20, r8
    LDI r20, CUR_ROW
    LOAD r4, r20
    ADD r4, r10
    CMPI r4, ROWS
    BLT r8, dn_store
    PUSH r31
    CALL scroll_up
    POP r31
    LDI r20, CUR_ROW
    LDI r4, 29
dn_store:
    STORE r20, r4
    RET

; =========================================
; SCROLL_UP
; =========================================
scroll_up:
    PUSH r31
    LDI r10, 1
    LDI r14, 0
scroll_loop:
    CMPI r14, 29
    BGE r8, scroll_clear

    LDI r20, BUF
    LDI r8, 0
    ADD r8, r14
    ADD r8, r10
    LDI r3, COLS
    MUL r8, r3
    ADD r20, r8

    LDI r21, BUF
    LDI r8, 0
    ADD r8, r14
    LDI r3, COLS
    MUL r8, r3
    ADD r21, r8

    LDI r22, 0
scroll_copy:
    LOAD r8, r20
    STORE r21, r8
    ADD r20, r10
    ADD r21, r10
    ADD r22, r10
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r14, r10
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r4, 29
    LDI r3, COLS
    MUL r4, r3
    ADD r20, r4
    LDI r4, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r4
    ADD r20, r10
    ADD r22, r10
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
