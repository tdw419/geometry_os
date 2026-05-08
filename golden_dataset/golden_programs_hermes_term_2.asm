; DESCRIPTION: Draw line: pos=the screen, color=red, size=fixed size.

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
;   r9: Result (reserved)
;   r11: Constant 1
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
#define RECV_BUF 0x5800

; =========================================
; INIT
; =========================================
LDI r11, 1
LDI r30, 0xFD00   ; Stack pointer

; Clear screen
LDI r9, 0x080812
FILL r9

; Clear text buffer to spaces
LDI r20, BUF
LDI r2, 32
clear_buf_init:
    STORE r20, r2
    ADD r20, r11
    CMPI r20, BUF_END
    BLT r9, clear_buf_init

; Init cursor and blink
LDI r20, CUR_COL
LDI r9, 0
STORE r20, r9
LDI r20, CUR_ROW
STORE r20, r9
LDI r20, BLINK
STORE r20, r9

; Title bar
LDI r11, 0
LDI r0, 0
LDI r10, 256
LDI r12, 16
LDI r5, 0x1A0033
RECTF r11, r0, r10, r12, r5

; Title text "Hermes Terminal"
LDI r20, SCRATCH
STRO r20, "Hermes Terminal"
LDI r11, 4
LDI r0, 4
LDI r10, SCRATCH
LDI r12, 0x00FF00  ; green
LDI r5, 0x1A0033  ; match title bar
DRAWTEXT r11, r0, r10, r12, r5

; Close button hit region
LDI r11, 220
LDI r0, 0
LDI r10, 36
LDI r12, 16
HITSET r11, r0, r10, r12, 99

LDI r11, 1

; Welcome messages
LDI r20, SCRATCH
STRO r20, "Hermes Terminal v2.0"
CALL write_line_to_buf
LDI r11, 1
LDI r20, SCRATCH
STRO r20, "Native Agent Bridge Active."
CALL write_line_to_buf
LDI r11, 1

CALL write_prompt
JMP main_loop

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r11, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r9, r20
    ADD r9, r11
    STORE r20, r9

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
    LDI r11, 1

    ; Clear content area
    LDI r11, 0
    LDI r0, 16
    LDI r10, 256
    LDI r12, 240
    LDI r5, 0x080812
    RECTF r11, r0, r10, r12, r5

    ; Row loop
    LDI r11, 1
    LDI r1, 8            ; CHAR_H
    LDI r13, 6            ; CHAR_W
    LDI r3, 0           ; row counter
    LDI r7, BUF         ; buffer pointer
    LDI r15, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to temporary display scratch
    ; We use 0x6000 as a temporary display scratch to avoid overwriting SCRATCH or RECV_BUF
    LDI r16, 0x6000
    LDI r17, 0
copy_col:
    LOAD r2, r7
    STORE r16, r2
    ADD r7, r11
    ADD r16, r11
    ADD r17, r11
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r9, 0
    STORE r16, r9

    ; Color based on content
    LDI r8, 0xCCCCCC  ; default light gray

    ; Check if row starts with '>' (user prompt) -> green
    LDI r16, 0x6000
    LOAD r2, r16
    CMPI r2, 62         ; '>'
    JNZ r9, render_text_default
    LDI r8, 0x44FF44  ; green for user input
    JMP render_text

render_text_default:
    LDI r8, 0x00FFFF  ; cyan for AI responses

render_text:
    ; DRAWTEXT x=0, y=r15, addr=0x6000, fg=r8, bg=0 (transparent)
    LDI r11, 0
    LDI r6, 0x6000
    LDI r4, 0         ; bg = transparent
    DRAWTEXT r11, r15, r6, r8, r4

    LDI r11, 1

    ADD r15, r1          ; y += 8
    ADD r3, r11          ; row++
    CMPI r3, ROWS
    BLT r3, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r9, r20
    LDI r14, 8
    AND r9, r14
    CMPI r9, 4
    BLT r9, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r9, r20
    MUL r9, r13           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r0, r20
    MUL r0, r1           ; row * 8
    LDI r10, 16
    ADD r0, r10           ; y = 16 + row*8
    LDI r10, 6
    LDI r12, 8
    LDI r5, 0x44FF44
    RECTF r9, r0, r10, r12, r5

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r5 = key
; =========================================
handle_key:
    PUSH r31
    LDI r11, 1

    CMPI r5, 13
    JNZ r9, check_bs
    JMP do_enter

check_bs:
    CMPI r5, 8
    JNZ r9, check_del
    JMP do_backspace

check_del:
    CMPI r5, 127
    JNZ r9, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r10, COLS
    MUL r0, r10           ; r0 = row * COLS
    LDI r20, CUR_COL
    LOAD r9, r20
    ADD r0, r9           ; r0 = row*COLS + col
    LDI r20, BUF
    ADD r20, r0          ; r20 = BUF + offset
    STORE r20, r5        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r9, r20
    ADD r9, r11
    STORE r20, r9

    ; If col >= COLS, wrap
    CMPI r9, COLS
    JNZ r9, hk_ret
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
    LDI r11, 1
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 47         ; '/'
    JNZ r9, call_hermes_ai  ; not a command, call AI

    ; Check /help
    ADD r20, r11
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r9, try_clear_cmd
    ADD r20, r11
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r9, try_clear_cmd
    ADD r20, r11
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r9, try_clear_cmd
    ADD r20, r11
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r9, try_clear_cmd
    ADD r20, r11
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r9, call_hermes_ai
    JMP cmd_help

try_clear_cmd:
    ; Check /clear
    LDI r20, SCRATCH
    ADD r20, r11           ; skip '/'
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r9, call_hermes_ai
    ADD r20, r11
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r9, call_hermes_ai
    ADD r20, r11
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r9, call_hermes_ai
    ADD r20, r11
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r9, call_hermes_ai
    ADD r20, r11
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r9, call_hermes_ai
    ADD r20, r11
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r9, call_hermes_ai
    JMP cmd_clear

    ; If not a known command, just call AI
    JMP call_hermes_ai

; =========================================
; COMMANDS
; =========================================
cmd_help:
    LDI r11, 1
    LDI r20, SCRATCH
    STRO r20, "/help /clear"
    CALL write_line_to_buf
    LDI r11, 1
    CALL write_prompt
    JMP hk_ret

cmd_clear:
    LDI r11, 1
    ; Clear text buffer to spaces
    LDI r20, BUF
    LDI r2, 32
clear_buf_cmd:
    STORE r20, r2
    ADD r20, r11
    CMPI r20, BUF_END
    BLT r9, clear_buf_cmd
    ; Reset cursor
    LDI r20, CUR_COL
    LDI r9, 0
    STORE r20, r9
    LDI r20, CUR_ROW
    STORE r20, r9
    CALL write_prompt
    JMP hk_ret

; =========================================
; CALL_HERMES_AI
; Call the HERMES opcode and process response
; =========================================
call_hermes_ai:
    LDI r11, 1

    ; Show "thinking" indicator
    LDI r20, SCRATCH
    STRO r20, "..."
    CALL write_line_to_buf
    LDI r11, 1
    CALL render  ; Force render to show "..."
    FRAME

    ; HERMES prompt_addr_reg, response_addr_reg, max_len_reg
    ; prompt is in SCRATCH, we'll put response in RECV_BUF
    LDI r0, SCRATCH
    LDI r10, RECV_BUF
    LDI r12, 2048
    HERMES r0, r10, r12

    ; Remove the "..." line (actually just overwrite it)
    ; We'll scroll up once to clear the "..." before writing response
    ; Wait, write_line_to_buf already advanced the row.
    ; Let's just write the response.

    ; If r9 == 0, something went wrong
    CMPI r9, 0
    JZ r9, hermes_failed

    ; Process the multiline response in RECV_BUF
    CALL process_response_buffer
    JMP call_hermes_done

hermes_failed:
    LDI r20, SCRATCH
    STRO r20, "Agent call failed."
    CALL write_line_to_buf

call_hermes_done:
    LDI r11, 1
    CALL write_prompt
    JMP hk_ret

; =========================================
; PROCESS_RESPONSE_BUFFER
; Split RECV_BUF by newlines and write each line
; =========================================
process_response_buffer:
    PUSH r31
    LDI r11, 1

    LDI r20, RECV_BUF
    LDI r21, SCRATCH      ; build current line into SCRATCH
    LDI r22, 0            ; char count

prb_loop:
    LOAD r9, r20
    JZ r9, prb_final      ; end of response

    CMPI r9, 10           ; newline
    JZ r9, prb_newline

    ; Store char (max 40)
    CMPI r22, 40
    BGE r9, prb_skip
    STORE r21, r9
    ADD r21, r11
    ADDI r22, 1
prb_skip:
    ADD r20, r11
    JMP prb_loop

prb_newline:
    LDI r9, 0
    STORE r21, r9         ; null terminate
    CALL write_line_to_buf
    LDI r11, 1
    LDI r21, SCRATCH
    LDI r22, 0
    ADD r20, r11
    JMP prb_loop

prb_final:
    ; Handle last line if any
    CMPI r22, 0
    JZ r9, prb_ret
    LDI r9, 0
    STORE r21, r9
    CALL write_line_to_buf

prb_ret:
    POP r31
    RET

; =========================================
; WRITE_PROMPT
; =========================================
write_prompt:
    PUSH r31
    LDI r11, 1
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r10, COLS
    MUL r0, r10
    LDI r20, BUF
    ADD r20, r0
    LDI r9, 62           ; '>'
    STORE r20, r9
    ADD r20, r11
    LDI r9, 32           ; ' '
    STORE r20, r9
    LDI r20, CUR_COL
    LDI r9, 2
    STORE r20, r9
    POP r31
    RET

; =========================================
; EXTRACT_CMD
; =========================================
extract_cmd:
    PUSH r31
    LDI r11, 1

    LDI r20, CUR_ROW
    LOAD r2, r20
    LDI r14, COLS
    MUL r2, r14

    LDI r20, CUR_COL
    LOAD r14, r20

    LDI r20, BUF
    ADD r20, r2
    ADD r20, r11
    ADD r20, r11           ; skip "> "

    LDI r21, SCRATCH
    LDI r22, 2
ec_loop:
    CMP r22, r14
    BGE r9, ec_done
    LOAD r9, r20
    STORE r21, r9
    ADD r20, r11
    ADD r21, r11
    ADD r22, r11
    JMP ec_loop

ec_done:
    LDI r9, 0
    STORE r21, r9
    POP r31
    RET

; =========================================
; WRITE_LINE_TO_BUF
; =========================================
write_line_to_buf:
    PUSH r31
    LDI r11, 1

    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r10, COLS
    MUL r0, r10
    LDI r20, BUF
    ADD r20, r0

    LDI r21, SCRATCH

wlb_loop:
    LOAD r9, r21
    JZ r9, wlb_done
    STORE r20, r9
    ADD r20, r11
    ADD r21, r11
    JMP wlb_loop

wlb_done:
    CALL do_newline
    POP r31
    RET

; =========================================
; DO_BACKSPACE
; =========================================
do_backspace:
    LDI r11, 1
    LDI r20, CUR_COL
    LOAD r9, r20
    CMPI r9, 2
    JZ r9, hk_ret

    SUBI r9, 1
    STORE r20, r9

    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r10, COLS
    MUL r0, r10
    LDI r20, CUR_COL
    LOAD r9, r20
    ADD r0, r9
    LDI r20, BUF
    ADD r20, r0
    LDI r9, 32
    STORE r20, r9
    JMP hk_ret

; =========================================
; DO_NEWLINE
; =========================================
do_newline:
    LDI r11, 1
    LDI r20, CUR_COL
    LDI r9, 0
    STORE r20, r9
    LDI r20, CUR_ROW
    LOAD r2, r20
    ADD r2, r11
    CMPI r2, ROWS
    BLT r9, dn_store
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
    LDI r11, 1
    LDI r3, 0
scroll_loop:
    CMPI r3, 29
    BGE r9, scroll_clear

    LDI r20, BUF
    LDI r9, 0
    ADD r9, r3
    ADD r9, r11
    LDI r7, COLS
    MUL r9, r7
    ADD r20, r9

    LDI r21, BUF
    LDI r9, 0
    ADD r9, r3
    LDI r7, COLS
    MUL r9, r7
    ADD r21, r9

    LDI r22, 0
scroll_copy:
    LOAD r9, r20
    STORE r21, r9
    ADD r20, r11
    ADD r21, r11
    ADD r22, r11
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r3, r11
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r2, 29
    LDI r7, COLS
    MUL r2, r7
    ADD r20, r2
    LDI r2, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r2
    ADD r20, r11
    ADD r22, r11
    CMPI r22, COLS
    BLT r9, scroll_clr_loop

    POP r31
    RET

; =========================================
; HK_RET -- common return point for handle_key
; =========================================
hk_ret:
    POP r31
    RET
