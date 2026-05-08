; DESCRIPTION: Draws a red line at the screen with fixed size.

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
;   r3: Result (reserved)
;   r7: Constant 1
;   r1: Key input
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
LDI r7, 1
LDI r30, 0xFD00   ; Stack pointer

; Clear screen
LDI r3, 0x080812
FILL r3

; Clear text buffer to spaces
LDI r20, BUF
LDI r2, 32
clear_buf_init:
    STORE r20, r2
    ADD r20, r7
    CMPI r20, BUF_END
    BLT r3, clear_buf_init

; Init cursor and blink
LDI r20, CUR_COL
LDI r3, 0
STORE r20, r3
LDI r20, CUR_ROW
STORE r20, r3
LDI r20, BLINK
STORE r20, r3

; Title bar
LDI r7, 0
LDI r11, 0
LDI r12, 256
LDI r9, 16
LDI r1, 0x1A0033
RECTF r7, r11, r12, r9, r1

; Title text "Hermes Terminal"
LDI r20, SCRATCH
STRO r20, "Hermes Terminal"
LDI r7, 4
LDI r11, 4
LDI r12, SCRATCH
LDI r9, 0x00FF00  ; green
LDI r1, 0x1A0033  ; match title bar
DRAWTEXT r7, r11, r12, r9, r1

; Close button hit region
LDI r7, 220
LDI r11, 0
LDI r12, 36
LDI r9, 16
HITSET r7, r11, r12, r9, 99

LDI r7, 1

; Welcome messages
LDI r20, SCRATCH
STRO r20, "Hermes Terminal v2.0"
CALL write_line_to_buf
LDI r7, 1
LDI r20, SCRATCH
STRO r20, "Native Agent Bridge Active."
CALL write_line_to_buf
LDI r7, 1

CALL write_prompt
JMP main_loop

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r7, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r3, r20
    ADD r3, r7
    STORE r20, r3

    ; Render
    CALL render

    FRAME

    ; Read key
    IKEY r1
    JZ r1, main_loop

    ; Handle key
    CALL handle_key
    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r7, 1

    ; Clear content area
    LDI r7, 0
    LDI r11, 16
    LDI r12, 256
    LDI r9, 240
    LDI r1, 0x080812
    RECTF r7, r11, r12, r9, r1

    ; Row loop
    LDI r7, 1
    LDI r4, 8            ; CHAR_H
    LDI r6, 6            ; CHAR_W
    LDI r14, 0           ; row counter
    LDI r8, BUF         ; buffer pointer
    LDI r15, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to temporary display scratch
    ; We use 0x6000 as a temporary display scratch to avoid overwriting SCRATCH or RECV_BUF
    LDI r16, 0x6000
    LDI r17, 0
copy_col:
    LOAD r2, r8
    STORE r16, r2
    ADD r8, r7
    ADD r16, r7
    ADD r17, r7
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r3, 0
    STORE r16, r3

    ; Color based on content
    LDI r0, 0xCCCCCC  ; default light gray

    ; Check if row starts with '>' (user prompt) -> green
    LDI r16, 0x6000
    LOAD r2, r16
    CMPI r2, 62         ; '>'
    JNZ r3, render_text_default
    LDI r0, 0x44FF44  ; green for user input
    JMP render_text

render_text_default:
    LDI r0, 0x00FFFF  ; cyan for AI responses

render_text:
    ; DRAWTEXT x=0, y=r15, addr=0x6000, fg=r0, bg=0 (transparent)
    LDI r7, 0
    LDI r13, 0x6000
    LDI r5, 0         ; bg = transparent
    DRAWTEXT r7, r15, r13, r0, r5

    LDI r7, 1

    ADD r15, r4          ; y += 8
    ADD r14, r7          ; row++
    CMPI r14, ROWS
    BLT r14, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r3, r20
    LDI r10, 8
    AND r3, r10
    CMPI r3, 4
    BLT r3, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r3, r20
    MUL r3, r6           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r11, r20
    MUL r11, r4           ; row * 8
    LDI r12, 16
    ADD r11, r12           ; y = 16 + row*8
    LDI r12, 6
    LDI r9, 8
    LDI r1, 0x44FF44
    RECTF r3, r11, r12, r9, r1

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r1 = key
; =========================================
handle_key:
    PUSH r31
    LDI r7, 1

    CMPI r1, 13
    JNZ r3, check_bs
    JMP do_enter

check_bs:
    CMPI r1, 8
    JNZ r3, check_del
    JMP do_backspace

check_del:
    CMPI r1, 127
    JNZ r3, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r12, COLS
    MUL r11, r12           ; r11 = row * COLS
    LDI r20, CUR_COL
    LOAD r3, r20
    ADD r11, r3           ; r11 = row*COLS + col
    LDI r20, BUF
    ADD r20, r11          ; r20 = BUF + offset
    STORE r20, r1        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r3, r20
    ADD r3, r7
    STORE r20, r3

    ; If col >= COLS, wrap
    CMPI r3, COLS
    JNZ r3, hk_ret
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
    LDI r7, 1
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 47         ; '/'
    JNZ r3, call_hermes_ai  ; not a command, call AI

    ; Check /help
    ADD r20, r7
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r3, try_clear_cmd
    ADD r20, r7
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r3, try_clear_cmd
    ADD r20, r7
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r3, try_clear_cmd
    ADD r20, r7
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r3, try_clear_cmd
    ADD r20, r7
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r3, call_hermes_ai
    JMP cmd_help

try_clear_cmd:
    ; Check /clear
    LDI r20, SCRATCH
    ADD r20, r7           ; skip '/'
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r3, call_hermes_ai
    ADD r20, r7
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r3, call_hermes_ai
    ADD r20, r7
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r3, call_hermes_ai
    ADD r20, r7
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r3, call_hermes_ai
    ADD r20, r7
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r3, call_hermes_ai
    ADD r20, r7
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r3, call_hermes_ai
    JMP cmd_clear

    ; If not a known command, just call AI
    JMP call_hermes_ai

; =========================================
; COMMANDS
; =========================================
cmd_help:
    LDI r7, 1
    LDI r20, SCRATCH
    STRO r20, "/help /clear"
    CALL write_line_to_buf
    LDI r7, 1
    CALL write_prompt
    JMP hk_ret

cmd_clear:
    LDI r7, 1
    ; Clear text buffer to spaces
    LDI r20, BUF
    LDI r2, 32
clear_buf_cmd:
    STORE r20, r2
    ADD r20, r7
    CMPI r20, BUF_END
    BLT r3, clear_buf_cmd
    ; Reset cursor
    LDI r20, CUR_COL
    LDI r3, 0
    STORE r20, r3
    LDI r20, CUR_ROW
    STORE r20, r3
    CALL write_prompt
    JMP hk_ret

; =========================================
; CALL_HERMES_AI
; Call the HERMES opcode and process response
; =========================================
call_hermes_ai:
    LDI r7, 1

    ; Show "thinking" indicator
    LDI r20, SCRATCH
    STRO r20, "..."
    CALL write_line_to_buf
    LDI r7, 1
    CALL render  ; Force render to show "..."
    FRAME

    ; HERMES prompt_addr_reg, response_addr_reg, max_len_reg
    ; prompt is in SCRATCH, we'll put response in RECV_BUF
    LDI r11, SCRATCH
    LDI r12, RECV_BUF
    LDI r9, 2048
    HERMES r11, r12, r9

    ; Remove the "..." line (actually just overwrite it)
    ; We'll scroll up once to clear the "..." before writing response
    ; Wait, write_line_to_buf already advanced the row.
    ; Let's just write the response.

    ; If r3 == 0, something went wrong
    CMPI r3, 0
    JZ r3, hermes_failed

    ; Process the multiline response in RECV_BUF
    CALL process_response_buffer
    JMP call_hermes_done

hermes_failed:
    LDI r20, SCRATCH
    STRO r20, "Agent call failed."
    CALL write_line_to_buf

call_hermes_done:
    LDI r7, 1
    CALL write_prompt
    JMP hk_ret

; =========================================
; PROCESS_RESPONSE_BUFFER
; Split RECV_BUF by newlines and write each line
; =========================================
process_response_buffer:
    PUSH r31
    LDI r7, 1

    LDI r20, RECV_BUF
    LDI r21, SCRATCH      ; build current line into SCRATCH
    LDI r22, 0            ; char count

prb_loop:
    LOAD r3, r20
    JZ r3, prb_final      ; end of response

    CMPI r3, 10           ; newline
    JZ r3, prb_newline

    ; Store char (max 40)
    CMPI r22, 40
    BGE r3, prb_skip
    STORE r21, r3
    ADD r21, r7
    ADDI r22, 1
prb_skip:
    ADD r20, r7
    JMP prb_loop

prb_newline:
    LDI r3, 0
    STORE r21, r3         ; null terminate
    CALL write_line_to_buf
    LDI r7, 1
    LDI r21, SCRATCH
    LDI r22, 0
    ADD r20, r7
    JMP prb_loop

prb_final:
    ; Handle last line if any
    CMPI r22, 0
    JZ r3, prb_ret
    LDI r3, 0
    STORE r21, r3
    CALL write_line_to_buf

prb_ret:
    POP r31
    RET

; =========================================
; WRITE_PROMPT
; =========================================
write_prompt:
    PUSH r31
    LDI r7, 1
    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r12, COLS
    MUL r11, r12
    LDI r20, BUF
    ADD r20, r11
    LDI r3, 62           ; '>'
    STORE r20, r3
    ADD r20, r7
    LDI r3, 32           ; ' '
    STORE r20, r3
    LDI r20, CUR_COL
    LDI r3, 2
    STORE r20, r3
    POP r31
    RET

; =========================================
; EXTRACT_CMD
; =========================================
extract_cmd:
    PUSH r31
    LDI r7, 1

    LDI r20, CUR_ROW
    LOAD r2, r20
    LDI r10, COLS
    MUL r2, r10

    LDI r20, CUR_COL
    LOAD r10, r20

    LDI r20, BUF
    ADD r20, r2
    ADD r20, r7
    ADD r20, r7           ; skip "> "

    LDI r21, SCRATCH
    LDI r22, 2
ec_loop:
    CMP r22, r10
    BGE r3, ec_done
    LOAD r3, r20
    STORE r21, r3
    ADD r20, r7
    ADD r21, r7
    ADD r22, r7
    JMP ec_loop

ec_done:
    LDI r3, 0
    STORE r21, r3
    POP r31
    RET

; =========================================
; WRITE_LINE_TO_BUF
; =========================================
write_line_to_buf:
    PUSH r31
    LDI r7, 1

    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r12, COLS
    MUL r11, r12
    LDI r20, BUF
    ADD r20, r11

    LDI r21, SCRATCH

wlb_loop:
    LOAD r3, r21
    JZ r3, wlb_done
    STORE r20, r3
    ADD r20, r7
    ADD r21, r7
    JMP wlb_loop

wlb_done:
    CALL do_newline
    POP r31
    RET

; =========================================
; DO_BACKSPACE
; =========================================
do_backspace:
    LDI r7, 1
    LDI r20, CUR_COL
    LOAD r3, r20
    CMPI r3, 2
    JZ r3, hk_ret

    SUBI r3, 1
    STORE r20, r3

    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r12, COLS
    MUL r11, r12
    LDI r20, CUR_COL
    LOAD r3, r20
    ADD r11, r3
    LDI r20, BUF
    ADD r20, r11
    LDI r3, 32
    STORE r20, r3
    JMP hk_ret

; =========================================
; DO_NEWLINE
; =========================================
do_newline:
    LDI r7, 1
    LDI r20, CUR_COL
    LDI r3, 0
    STORE r20, r3
    LDI r20, CUR_ROW
    LOAD r2, r20
    ADD r2, r7
    CMPI r2, ROWS
    BLT r3, dn_store
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
    LDI r7, 1
    LDI r14, 0
scroll_loop:
    CMPI r14, 29
    BGE r3, scroll_clear

    LDI r20, BUF
    LDI r3, 0
    ADD r3, r14
    ADD r3, r7
    LDI r8, COLS
    MUL r3, r8
    ADD r20, r3

    LDI r21, BUF
    LDI r3, 0
    ADD r3, r14
    LDI r8, COLS
    MUL r3, r8
    ADD r21, r3

    LDI r22, 0
scroll_copy:
    LOAD r3, r20
    STORE r21, r3
    ADD r20, r7
    ADD r21, r7
    ADD r22, r7
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r14, r7
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r2, 29
    LDI r8, COLS
    MUL r2, r8
    ADD r20, r2
    LDI r2, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r2
    ADD r20, r7
    ADD r22, r7
    CMPI r22, COLS
    BLT r3, scroll_clr_loop

    POP r31
    RET

; =========================================
; HK_RET -- common return point for handle_key
; =========================================
hk_ret:
    POP r31
    RET
