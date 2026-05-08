; DESCRIPTION: Render a red line at the screen.

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
;   r5: Result (reserved)
;   r8: Constant 1
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
LDI r8, 1
LDI r30, 0xFD00   ; Stack pointer

; Clear screen
LDI r5, 0x080812
FILL r5

; Clear text buffer to spaces
LDI r20, BUF
LDI r0, 32
clear_buf_init:
    STORE r20, r0
    ADD r20, r8
    CMPI r20, BUF_END
    BLT r5, clear_buf_init

; Init cursor and blink
LDI r20, CUR_COL
LDI r5, 0
STORE r20, r5
LDI r20, CUR_ROW
STORE r20, r5
LDI r20, BLINK
STORE r20, r5

; Title bar
LDI r8, 0
LDI r6, 0
LDI r14, 256
LDI r11, 16
LDI r9, 0x1A0033
RECTF r8, r6, r14, r11, r9

; Title text "Hermes Terminal"
LDI r20, SCRATCH
STRO r20, "Hermes Terminal"
LDI r8, 4
LDI r6, 4
LDI r14, SCRATCH
LDI r11, 0x00FF00  ; green
LDI r9, 0x1A0033  ; match title bar
DRAWTEXT r8, r6, r14, r11, r9

; Close button hit region
LDI r8, 220
LDI r6, 0
LDI r14, 36
LDI r11, 16
HITSET r8, r6, r14, r11, 99

LDI r8, 1

; Welcome messages
LDI r20, SCRATCH
STRO r20, "Hermes Terminal v2.0"
CALL write_line_to_buf
LDI r8, 1
LDI r20, SCRATCH
STRO r20, "Native Agent Bridge Active."
CALL write_line_to_buf
LDI r8, 1

CALL write_prompt
JMP main_loop

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r8, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r5, r20
    ADD r5, r8
    STORE r20, r5

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
    LDI r8, 1

    ; Clear content area
    LDI r8, 0
    LDI r6, 16
    LDI r14, 256
    LDI r11, 240
    LDI r9, 0x080812
    RECTF r8, r6, r14, r11, r9

    ; Row loop
    LDI r8, 1
    LDI r1, 8            ; CHAR_H
    LDI r13, 6            ; CHAR_W
    LDI r10, 0           ; row counter
    LDI r15, BUF         ; buffer pointer
    LDI r4, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to temporary display scratch
    ; We use 0x6000 as a temporary display scratch to avoid overwriting SCRATCH or RECV_BUF
    LDI r16, 0x6000
    LDI r17, 0
copy_col:
    LOAD r0, r15
    STORE r16, r0
    ADD r15, r8
    ADD r16, r8
    ADD r17, r8
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r5, 0
    STORE r16, r5

    ; Color based on content
    LDI r3, 0xCCCCCC  ; default light gray

    ; Check if row starts with '>' (user prompt) -> green
    LDI r16, 0x6000
    LOAD r0, r16
    CMPI r0, 62         ; '>'
    JNZ r5, render_text_default
    LDI r3, 0x44FF44  ; green for user input
    JMP render_text

render_text_default:
    LDI r3, 0x00FFFF  ; cyan for AI responses

render_text:
    ; DRAWTEXT x=0, y=r4, addr=0x6000, fg=r3, bg=0 (transparent)
    LDI r8, 0
    LDI r7, 0x6000
    LDI r12, 0         ; bg = transparent
    DRAWTEXT r8, r4, r7, r3, r12

    LDI r8, 1

    ADD r4, r1          ; y += 8
    ADD r10, r8          ; row++
    CMPI r10, ROWS
    BLT r10, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r5, r20
    LDI r2, 8
    AND r5, r2
    CMPI r5, 4
    BLT r5, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r5, r20
    MUL r5, r13           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r6, r20
    MUL r6, r1           ; row * 8
    LDI r14, 16
    ADD r6, r14           ; y = 16 + row*8
    LDI r14, 6
    LDI r11, 8
    LDI r9, 0x44FF44
    RECTF r5, r6, r14, r11, r9

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r9 = key
; =========================================
handle_key:
    PUSH r31
    LDI r8, 1

    CMPI r9, 13
    JNZ r5, check_bs
    JMP do_enter

check_bs:
    CMPI r9, 8
    JNZ r5, check_del
    JMP do_backspace

check_del:
    CMPI r9, 127
    JNZ r5, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r14, COLS
    MUL r6, r14           ; r6 = row * COLS
    LDI r20, CUR_COL
    LOAD r5, r20
    ADD r6, r5           ; r6 = row*COLS + col
    LDI r20, BUF
    ADD r20, r6          ; r20 = BUF + offset
    STORE r20, r9        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r5, r20
    ADD r5, r8
    STORE r20, r5

    ; If col >= COLS, wrap
    CMPI r5, COLS
    JNZ r5, hk_ret
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
    LDI r8, 1
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 47         ; '/'
    JNZ r5, call_hermes_ai  ; not a command, call AI

    ; Check /help
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r5, try_clear_cmd
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r5, try_clear_cmd
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r5, try_clear_cmd
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r5, try_clear_cmd
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, call_hermes_ai
    JMP cmd_help

try_clear_cmd:
    ; Check /clear
    LDI r20, SCRATCH
    ADD r20, r8           ; skip '/'
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r5, call_hermes_ai
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r5, call_hermes_ai
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r5, call_hermes_ai
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r5, call_hermes_ai
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r5, call_hermes_ai
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, call_hermes_ai
    JMP cmd_clear

    ; If not a known command, just call AI
    JMP call_hermes_ai

; =========================================
; COMMANDS
; =========================================
cmd_help:
    LDI r8, 1
    LDI r20, SCRATCH
    STRO r20, "/help /clear"
    CALL write_line_to_buf
    LDI r8, 1
    CALL write_prompt
    JMP hk_ret

cmd_clear:
    LDI r8, 1
    ; Clear text buffer to spaces
    LDI r20, BUF
    LDI r0, 32
clear_buf_cmd:
    STORE r20, r0
    ADD r20, r8
    CMPI r20, BUF_END
    BLT r5, clear_buf_cmd
    ; Reset cursor
    LDI r20, CUR_COL
    LDI r5, 0
    STORE r20, r5
    LDI r20, CUR_ROW
    STORE r20, r5
    CALL write_prompt
    JMP hk_ret

; =========================================
; CALL_HERMES_AI
; Call the HERMES opcode and process response
; =========================================
call_hermes_ai:
    LDI r8, 1

    ; Show "thinking" indicator
    LDI r20, SCRATCH
    STRO r20, "..."
    CALL write_line_to_buf
    LDI r8, 1
    CALL render  ; Force render to show "..."
    FRAME

    ; HERMES prompt_addr_reg, response_addr_reg, max_len_reg
    ; prompt is in SCRATCH, we'll put response in RECV_BUF
    LDI r6, SCRATCH
    LDI r14, RECV_BUF
    LDI r11, 2048
    HERMES r6, r14, r11

    ; Remove the "..." line (actually just overwrite it)
    ; We'll scroll up once to clear the "..." before writing response
    ; Wait, write_line_to_buf already advanced the row.
    ; Let's just write the response.

    ; If r5 == 0, something went wrong
    CMPI r5, 0
    JZ r5, hermes_failed

    ; Process the multiline response in RECV_BUF
    CALL process_response_buffer
    JMP call_hermes_done

hermes_failed:
    LDI r20, SCRATCH
    STRO r20, "Agent call failed."
    CALL write_line_to_buf

call_hermes_done:
    LDI r8, 1
    CALL write_prompt
    JMP hk_ret

; =========================================
; PROCESS_RESPONSE_BUFFER
; Split RECV_BUF by newlines and write each line
; =========================================
process_response_buffer:
    PUSH r31
    LDI r8, 1

    LDI r20, RECV_BUF
    LDI r21, SCRATCH      ; build current line into SCRATCH
    LDI r22, 0            ; char count

prb_loop:
    LOAD r5, r20
    JZ r5, prb_final      ; end of response

    CMPI r5, 10           ; newline
    JZ r5, prb_newline

    ; Store char (max 40)
    CMPI r22, 40
    BGE r5, prb_skip
    STORE r21, r5
    ADD r21, r8
    ADDI r22, 1
prb_skip:
    ADD r20, r8
    JMP prb_loop

prb_newline:
    LDI r5, 0
    STORE r21, r5         ; null terminate
    CALL write_line_to_buf
    LDI r8, 1
    LDI r21, SCRATCH
    LDI r22, 0
    ADD r20, r8
    JMP prb_loop

prb_final:
    ; Handle last line if any
    CMPI r22, 0
    JZ r5, prb_ret
    LDI r5, 0
    STORE r21, r5
    CALL write_line_to_buf

prb_ret:
    POP r31
    RET

; =========================================
; WRITE_PROMPT
; =========================================
write_prompt:
    PUSH r31
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r14, COLS
    MUL r6, r14
    LDI r20, BUF
    ADD r20, r6
    LDI r5, 62           ; '>'
    STORE r20, r5
    ADD r20, r8
    LDI r5, 32           ; ' '
    STORE r20, r5
    LDI r20, CUR_COL
    LDI r5, 2
    STORE r20, r5
    POP r31
    RET

; =========================================
; EXTRACT_CMD
; =========================================
extract_cmd:
    PUSH r31
    LDI r8, 1

    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r2, COLS
    MUL r0, r2

    LDI r20, CUR_COL
    LOAD r2, r20

    LDI r20, BUF
    ADD r20, r0
    ADD r20, r8
    ADD r20, r8           ; skip "> "

    LDI r21, SCRATCH
    LDI r22, 2
ec_loop:
    CMP r22, r2
    BGE r5, ec_done
    LOAD r5, r20
    STORE r21, r5
    ADD r20, r8
    ADD r21, r8
    ADD r22, r8
    JMP ec_loop

ec_done:
    LDI r5, 0
    STORE r21, r5
    POP r31
    RET

; =========================================
; WRITE_LINE_TO_BUF
; =========================================
write_line_to_buf:
    PUSH r31
    LDI r8, 1

    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r14, COLS
    MUL r6, r14
    LDI r20, BUF
    ADD r20, r6

    LDI r21, SCRATCH

wlb_loop:
    LOAD r5, r21
    JZ r5, wlb_done
    STORE r20, r5
    ADD r20, r8
    ADD r21, r8
    JMP wlb_loop

wlb_done:
    CALL do_newline
    POP r31
    RET

; =========================================
; DO_BACKSPACE
; =========================================
do_backspace:
    LDI r8, 1
    LDI r20, CUR_COL
    LOAD r5, r20
    CMPI r5, 2
    JZ r5, hk_ret

    SUBI r5, 1
    STORE r20, r5

    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r14, COLS
    MUL r6, r14
    LDI r20, CUR_COL
    LOAD r5, r20
    ADD r6, r5
    LDI r20, BUF
    ADD r20, r6
    LDI r5, 32
    STORE r20, r5
    JMP hk_ret

; =========================================
; DO_NEWLINE
; =========================================
do_newline:
    LDI r8, 1
    LDI r20, CUR_COL
    LDI r5, 0
    STORE r20, r5
    LDI r20, CUR_ROW
    LOAD r0, r20
    ADD r0, r8
    CMPI r0, ROWS
    BLT r5, dn_store
    PUSH r31
    CALL scroll_up
    POP r31
    LDI r20, CUR_ROW
    LDI r0, 29
dn_store:
    STORE r20, r0
    RET

; =========================================
; SCROLL_UP
; =========================================
scroll_up:
    PUSH r31
    LDI r8, 1
    LDI r10, 0
scroll_loop:
    CMPI r10, 29
    BGE r5, scroll_clear

    LDI r20, BUF
    LDI r5, 0
    ADD r5, r10
    ADD r5, r8
    LDI r15, COLS
    MUL r5, r15
    ADD r20, r5

    LDI r21, BUF
    LDI r5, 0
    ADD r5, r10
    LDI r15, COLS
    MUL r5, r15
    ADD r21, r5

    LDI r22, 0
scroll_copy:
    LOAD r5, r20
    STORE r21, r5
    ADD r20, r8
    ADD r21, r8
    ADD r22, r8
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r10, r8
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r0, 29
    LDI r15, COLS
    MUL r0, r15
    ADD r20, r0
    LDI r0, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r0
    ADD r20, r8
    ADD r22, r8
    CMPI r22, COLS
    BLT r5, scroll_clr_loop

    POP r31
    RET

; =========================================
; HK_RET -- common return point for handle_key
; =========================================
hk_ret:
    POP r31
    RET
