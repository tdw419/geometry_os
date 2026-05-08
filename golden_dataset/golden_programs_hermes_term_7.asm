; DESCRIPTION: Display a line using color red at the screen.

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
;   r13: Result (reserved)
;   r6: Constant 1
;   r2: Key input
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
LDI r6, 1
LDI r30, 0xFD00   ; Stack pointer

; Clear screen
LDI r13, 0x080812
FILL r13

; Clear text buffer to spaces
LDI r20, BUF
LDI r10, 32
clear_buf_init:
    STORE r20, r10
    ADD r20, r6
    CMPI r20, BUF_END
    BLT r13, clear_buf_init

; Init cursor and blink
LDI r20, CUR_COL
LDI r13, 0
STORE r20, r13
LDI r20, CUR_ROW
STORE r20, r13
LDI r20, BLINK
STORE r20, r13

; Title bar
LDI r6, 0
LDI r9, 0
LDI r0, 256
LDI r14, 16
LDI r2, 0x1A0033
RECTF r6, r9, r0, r14, r2

; Title text "Hermes Terminal"
LDI r20, SCRATCH
STRO r20, "Hermes Terminal"
LDI r6, 4
LDI r9, 4
LDI r0, SCRATCH
LDI r14, 0x00FF00  ; green
LDI r2, 0x1A0033  ; match title bar
DRAWTEXT r6, r9, r0, r14, r2

; Close button hit region
LDI r6, 220
LDI r9, 0
LDI r0, 36
LDI r14, 16
HITSET r6, r9, r0, r14, 99

LDI r6, 1

; Welcome messages
LDI r20, SCRATCH
STRO r20, "Hermes Terminal v2.0"
CALL write_line_to_buf
LDI r6, 1
LDI r20, SCRATCH
STRO r20, "Native Agent Bridge Active."
CALL write_line_to_buf
LDI r6, 1

CALL write_prompt
JMP main_loop

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r6, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r13, r20
    ADD r13, r6
    STORE r20, r13

    ; Render
    CALL render

    FRAME

    ; Read key
    IKEY r2
    JZ r2, main_loop

    ; Handle key
    CALL handle_key
    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r6, 1

    ; Clear content area
    LDI r6, 0
    LDI r9, 16
    LDI r0, 256
    LDI r14, 240
    LDI r2, 0x080812
    RECTF r6, r9, r0, r14, r2

    ; Row loop
    LDI r6, 1
    LDI r8, 8            ; CHAR_H
    LDI r7, 6            ; CHAR_W
    LDI r1, 0           ; row counter
    LDI r11, BUF         ; buffer pointer
    LDI r5, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to temporary display scratch
    ; We use 0x6000 as a temporary display scratch to avoid overwriting SCRATCH or RECV_BUF
    LDI r16, 0x6000
    LDI r17, 0
copy_col:
    LOAD r10, r11
    STORE r16, r10
    ADD r11, r6
    ADD r16, r6
    ADD r17, r6
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r13, 0
    STORE r16, r13

    ; Color based on content
    LDI r15, 0xCCCCCC  ; default light gray

    ; Check if row starts with '>' (user prompt) -> green
    LDI r16, 0x6000
    LOAD r10, r16
    CMPI r10, 62         ; '>'
    JNZ r13, render_text_default
    LDI r15, 0x44FF44  ; green for user input
    JMP render_text

render_text_default:
    LDI r15, 0x00FFFF  ; cyan for AI responses

render_text:
    ; DRAWTEXT x=0, y=r5, addr=0x6000, fg=r15, bg=0 (transparent)
    LDI r6, 0
    LDI r12, 0x6000
    LDI r3, 0         ; bg = transparent
    DRAWTEXT r6, r5, r12, r15, r3

    LDI r6, 1

    ADD r5, r8          ; y += 8
    ADD r1, r6          ; row++
    CMPI r1, ROWS
    BLT r1, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r13, r20
    LDI r4, 8
    AND r13, r4
    CMPI r13, 4
    BLT r13, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r13, r20
    MUL r13, r7           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r9, r20
    MUL r9, r8           ; row * 8
    LDI r0, 16
    ADD r9, r0           ; y = 16 + row*8
    LDI r0, 6
    LDI r14, 8
    LDI r2, 0x44FF44
    RECTF r13, r9, r0, r14, r2

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r2 = key
; =========================================
handle_key:
    PUSH r31
    LDI r6, 1

    CMPI r2, 13
    JNZ r13, check_bs
    JMP do_enter

check_bs:
    CMPI r2, 8
    JNZ r13, check_del
    JMP do_backspace

check_del:
    CMPI r2, 127
    JNZ r13, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r0, COLS
    MUL r9, r0           ; r9 = row * COLS
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r9, r13           ; r9 = row*COLS + col
    LDI r20, BUF
    ADD r20, r9          ; r20 = BUF + offset
    STORE r20, r2        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r13, r6
    STORE r20, r13

    ; If col >= COLS, wrap
    CMPI r13, COLS
    JNZ r13, hk_ret
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
    LDI r6, 1
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 47         ; '/'
    JNZ r13, call_hermes_ai  ; not a command, call AI

    ; Check /help
    ADD r20, r6
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r13, try_clear_cmd
    ADD r20, r6
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r13, try_clear_cmd
    ADD r20, r6
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r13, try_clear_cmd
    ADD r20, r6
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r13, try_clear_cmd
    ADD r20, r6
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r13, call_hermes_ai
    JMP cmd_help

try_clear_cmd:
    ; Check /clear
    LDI r20, SCRATCH
    ADD r20, r6           ; skip '/'
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r13, call_hermes_ai
    ADD r20, r6
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r13, call_hermes_ai
    ADD r20, r6
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r13, call_hermes_ai
    ADD r20, r6
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r13, call_hermes_ai
    ADD r20, r6
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r13, call_hermes_ai
    ADD r20, r6
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r13, call_hermes_ai
    JMP cmd_clear

    ; If not a known command, just call AI
    JMP call_hermes_ai

; =========================================
; COMMANDS
; =========================================
cmd_help:
    LDI r6, 1
    LDI r20, SCRATCH
    STRO r20, "/help /clear"
    CALL write_line_to_buf
    LDI r6, 1
    CALL write_prompt
    JMP hk_ret

cmd_clear:
    LDI r6, 1
    ; Clear text buffer to spaces
    LDI r20, BUF
    LDI r10, 32
clear_buf_cmd:
    STORE r20, r10
    ADD r20, r6
    CMPI r20, BUF_END
    BLT r13, clear_buf_cmd
    ; Reset cursor
    LDI r20, CUR_COL
    LDI r13, 0
    STORE r20, r13
    LDI r20, CUR_ROW
    STORE r20, r13
    CALL write_prompt
    JMP hk_ret

; =========================================
; CALL_HERMES_AI
; Call the HERMES opcode and process response
; =========================================
call_hermes_ai:
    LDI r6, 1

    ; Show "thinking" indicator
    LDI r20, SCRATCH
    STRO r20, "..."
    CALL write_line_to_buf
    LDI r6, 1
    CALL render  ; Force render to show "..."
    FRAME

    ; HERMES prompt_addr_reg, response_addr_reg, max_len_reg
    ; prompt is in SCRATCH, we'll put response in RECV_BUF
    LDI r9, SCRATCH
    LDI r0, RECV_BUF
    LDI r14, 2048
    HERMES r9, r0, r14

    ; Remove the "..." line (actually just overwrite it)
    ; We'll scroll up once to clear the "..." before writing response
    ; Wait, write_line_to_buf already advanced the row.
    ; Let's just write the response.

    ; If r13 == 0, something went wrong
    CMPI r13, 0
    JZ r13, hermes_failed

    ; Process the multiline response in RECV_BUF
    CALL process_response_buffer
    JMP call_hermes_done

hermes_failed:
    LDI r20, SCRATCH
    STRO r20, "Agent call failed."
    CALL write_line_to_buf

call_hermes_done:
    LDI r6, 1
    CALL write_prompt
    JMP hk_ret

; =========================================
; PROCESS_RESPONSE_BUFFER
; Split RECV_BUF by newlines and write each line
; =========================================
process_response_buffer:
    PUSH r31
    LDI r6, 1

    LDI r20, RECV_BUF
    LDI r21, SCRATCH      ; build current line into SCRATCH
    LDI r22, 0            ; char count

prb_loop:
    LOAD r13, r20
    JZ r13, prb_final      ; end of response

    CMPI r13, 10           ; newline
    JZ r13, prb_newline

    ; Store char (max 40)
    CMPI r22, 40
    BGE r13, prb_skip
    STORE r21, r13
    ADD r21, r6
    ADDI r22, 1
prb_skip:
    ADD r20, r6
    JMP prb_loop

prb_newline:
    LDI r13, 0
    STORE r21, r13         ; null terminate
    CALL write_line_to_buf
    LDI r6, 1
    LDI r21, SCRATCH
    LDI r22, 0
    ADD r20, r6
    JMP prb_loop

prb_final:
    ; Handle last line if any
    CMPI r22, 0
    JZ r13, prb_ret
    LDI r13, 0
    STORE r21, r13
    CALL write_line_to_buf

prb_ret:
    POP r31
    RET

; =========================================
; WRITE_PROMPT
; =========================================
write_prompt:
    PUSH r31
    LDI r6, 1
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r0, COLS
    MUL r9, r0
    LDI r20, BUF
    ADD r20, r9
    LDI r13, 62           ; '>'
    STORE r20, r13
    ADD r20, r6
    LDI r13, 32           ; ' '
    STORE r20, r13
    LDI r20, CUR_COL
    LDI r13, 2
    STORE r20, r13
    POP r31
    RET

; =========================================
; EXTRACT_CMD
; =========================================
extract_cmd:
    PUSH r31
    LDI r6, 1

    LDI r20, CUR_ROW
    LOAD r10, r20
    LDI r4, COLS
    MUL r10, r4

    LDI r20, CUR_COL
    LOAD r4, r20

    LDI r20, BUF
    ADD r20, r10
    ADD r20, r6
    ADD r20, r6           ; skip "> "

    LDI r21, SCRATCH
    LDI r22, 2
ec_loop:
    CMP r22, r4
    BGE r13, ec_done
    LOAD r13, r20
    STORE r21, r13
    ADD r20, r6
    ADD r21, r6
    ADD r22, r6
    JMP ec_loop

ec_done:
    LDI r13, 0
    STORE r21, r13
    POP r31
    RET

; =========================================
; WRITE_LINE_TO_BUF
; =========================================
write_line_to_buf:
    PUSH r31
    LDI r6, 1

    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r0, COLS
    MUL r9, r0
    LDI r20, BUF
    ADD r20, r9

    LDI r21, SCRATCH

wlb_loop:
    LOAD r13, r21
    JZ r13, wlb_done
    STORE r20, r13
    ADD r20, r6
    ADD r21, r6
    JMP wlb_loop

wlb_done:
    CALL do_newline
    POP r31
    RET

; =========================================
; DO_BACKSPACE
; =========================================
do_backspace:
    LDI r6, 1
    LDI r20, CUR_COL
    LOAD r13, r20
    CMPI r13, 2
    JZ r13, hk_ret

    SUBI r13, 1
    STORE r20, r13

    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r0, COLS
    MUL r9, r0
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r9, r13
    LDI r20, BUF
    ADD r20, r9
    LDI r13, 32
    STORE r20, r13
    JMP hk_ret

; =========================================
; DO_NEWLINE
; =========================================
do_newline:
    LDI r6, 1
    LDI r20, CUR_COL
    LDI r13, 0
    STORE r20, r13
    LDI r20, CUR_ROW
    LOAD r10, r20
    ADD r10, r6
    CMPI r10, ROWS
    BLT r13, dn_store
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
    LDI r6, 1
    LDI r1, 0
scroll_loop:
    CMPI r1, 29
    BGE r13, scroll_clear

    LDI r20, BUF
    LDI r13, 0
    ADD r13, r1
    ADD r13, r6
    LDI r11, COLS
    MUL r13, r11
    ADD r20, r13

    LDI r21, BUF
    LDI r13, 0
    ADD r13, r1
    LDI r11, COLS
    MUL r13, r11
    ADD r21, r13

    LDI r22, 0
scroll_copy:
    LOAD r13, r20
    STORE r21, r13
    ADD r20, r6
    ADD r21, r6
    ADD r22, r6
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r1, r6
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r10, 29
    LDI r11, COLS
    MUL r10, r11
    ADD r20, r10
    LDI r10, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r10
    ADD r20, r6
    ADD r22, r6
    CMPI r22, COLS
    BLT r13, scroll_clr_loop

    POP r31
    RET

; =========================================
; HK_RET -- common return point for handle_key
; =========================================
hk_ret:
    POP r31
    RET
