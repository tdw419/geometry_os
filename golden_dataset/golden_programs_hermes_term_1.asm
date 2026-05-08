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
;   r13: Result (reserved)
;   r3: Constant 1
;   r10: Key input
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
LDI r13, 0x080812
FILL r13

; Clear text buffer to spaces
LDI r20, BUF
LDI r6, 32
clear_buf_init:
    STORE r20, r6
    ADD r20, r3
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
LDI r3, 0
LDI r15, 0
LDI r12, 256
LDI r1, 16
LDI r10, 0x1A0033
RECTF r3, r15, r12, r1, r10

; Title text "Hermes Terminal"
LDI r20, SCRATCH
STRO r20, "Hermes Terminal"
LDI r3, 4
LDI r15, 4
LDI r12, SCRATCH
LDI r1, 0x00FF00  ; green
LDI r10, 0x1A0033  ; match title bar
DRAWTEXT r3, r15, r12, r1, r10

; Close button hit region
LDI r3, 220
LDI r15, 0
LDI r12, 36
LDI r1, 16
HITSET r3, r15, r12, r1, 99

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
    LOAD r13, r20
    ADD r13, r3
    STORE r20, r13

    ; Render
    CALL render

    FRAME

    ; Read key
    IKEY r10
    JZ r10, main_loop

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
    LDI r15, 16
    LDI r12, 256
    LDI r1, 240
    LDI r10, 0x080812
    RECTF r3, r15, r12, r1, r10

    ; Row loop
    LDI r3, 1
    LDI r11, 8            ; CHAR_H
    LDI r5, 6            ; CHAR_W
    LDI r0, 0           ; row counter
    LDI r9, BUF         ; buffer pointer
    LDI r2, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to temporary display scratch
    ; We use 0x6000 as a temporary display scratch to avoid overwriting SCRATCH or RECV_BUF
    LDI r16, 0x6000
    LDI r17, 0
copy_col:
    LOAD r6, r9
    STORE r16, r6
    ADD r9, r3
    ADD r16, r3
    ADD r17, r3
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r13, 0
    STORE r16, r13

    ; Color based on content
    LDI r4, 0xCCCCCC  ; default light gray

    ; Check if row starts with '>' (user prompt) -> green
    LDI r16, 0x6000
    LOAD r6, r16
    CMPI r6, 62         ; '>'
    JNZ r13, render_text_default
    LDI r4, 0x44FF44  ; green for user input
    JMP render_text

render_text_default:
    LDI r4, 0x00FFFF  ; cyan for AI responses

render_text:
    ; DRAWTEXT x=0, y=r2, addr=0x6000, fg=r4, bg=0 (transparent)
    LDI r3, 0
    LDI r8, 0x6000
    LDI r14, 0         ; bg = transparent
    DRAWTEXT r3, r2, r8, r4, r14

    LDI r3, 1

    ADD r2, r11          ; y += 8
    ADD r0, r3          ; row++
    CMPI r0, ROWS
    BLT r0, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r13, r20
    LDI r7, 8
    AND r13, r7
    CMPI r13, 4
    BLT r13, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r13, r20
    MUL r13, r5           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r15, r20
    MUL r15, r11           ; row * 8
    LDI r12, 16
    ADD r15, r12           ; y = 16 + row*8
    LDI r12, 6
    LDI r1, 8
    LDI r10, 0x44FF44
    RECTF r13, r15, r12, r1, r10

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r10 = key
; =========================================
handle_key:
    PUSH r31
    LDI r3, 1

    CMPI r10, 13
    JNZ r13, check_bs
    JMP do_enter

check_bs:
    CMPI r10, 8
    JNZ r13, check_del
    JMP do_backspace

check_del:
    CMPI r10, 127
    JNZ r13, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r12, COLS
    MUL r15, r12           ; r15 = row * COLS
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r15, r13           ; r15 = row*COLS + col
    LDI r20, BUF
    ADD r20, r15          ; r20 = BUF + offset
    STORE r20, r10        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r13, r3
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
    LDI r3, 1
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 47         ; '/'
    JNZ r13, call_hermes_ai  ; not a command, call AI

    ; Check /help
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r13, try_clear_cmd
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r13, try_clear_cmd
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r13, try_clear_cmd
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r13, try_clear_cmd
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r13, call_hermes_ai
    JMP cmd_help

try_clear_cmd:
    ; Check /clear
    LDI r20, SCRATCH
    ADD r20, r3           ; skip '/'
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r13, call_hermes_ai
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r13, call_hermes_ai
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r13, call_hermes_ai
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r13, call_hermes_ai
    ADD r20, r3
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r13, call_hermes_ai
    ADD r20, r3
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
    LDI r6, 32
clear_buf_cmd:
    STORE r20, r6
    ADD r20, r3
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
    LDI r15, SCRATCH
    LDI r12, RECV_BUF
    LDI r1, 2048
    HERMES r15, r12, r1

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
    LOAD r13, r20
    JZ r13, prb_final      ; end of response

    CMPI r13, 10           ; newline
    JZ r13, prb_newline

    ; Store char (max 40)
    CMPI r22, 40
    BGE r13, prb_skip
    STORE r21, r13
    ADD r21, r3
    ADDI r22, 1
prb_skip:
    ADD r20, r3
    JMP prb_loop

prb_newline:
    LDI r13, 0
    STORE r21, r13         ; null terminate
    CALL write_line_to_buf
    LDI r3, 1
    LDI r21, SCRATCH
    LDI r22, 0
    ADD r20, r3
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
    LDI r3, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r12, COLS
    MUL r15, r12
    LDI r20, BUF
    ADD r20, r15
    LDI r13, 62           ; '>'
    STORE r20, r13
    ADD r20, r3
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
    LDI r3, 1

    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r7, COLS
    MUL r6, r7

    LDI r20, CUR_COL
    LOAD r7, r20

    LDI r20, BUF
    ADD r20, r6
    ADD r20, r3
    ADD r20, r3           ; skip "> "

    LDI r21, SCRATCH
    LDI r22, 2
ec_loop:
    CMP r22, r7
    BGE r13, ec_done
    LOAD r13, r20
    STORE r21, r13
    ADD r20, r3
    ADD r21, r3
    ADD r22, r3
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
    LDI r3, 1

    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r12, COLS
    MUL r15, r12
    LDI r20, BUF
    ADD r20, r15

    LDI r21, SCRATCH

wlb_loop:
    LOAD r13, r21
    JZ r13, wlb_done
    STORE r20, r13
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
    LOAD r13, r20
    CMPI r13, 2
    JZ r13, hk_ret

    SUBI r13, 1
    STORE r20, r13

    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r12, COLS
    MUL r15, r12
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r15, r13
    LDI r20, BUF
    ADD r20, r15
    LDI r13, 32
    STORE r20, r13
    JMP hk_ret

; =========================================
; DO_NEWLINE
; =========================================
do_newline:
    LDI r3, 1
    LDI r20, CUR_COL
    LDI r13, 0
    STORE r20, r13
    LDI r20, CUR_ROW
    LOAD r6, r20
    ADD r6, r3
    CMPI r6, ROWS
    BLT r13, dn_store
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
; =========================================
scroll_up:
    PUSH r31
    LDI r3, 1
    LDI r0, 0
scroll_loop:
    CMPI r0, 29
    BGE r13, scroll_clear

    LDI r20, BUF
    LDI r13, 0
    ADD r13, r0
    ADD r13, r3
    LDI r9, COLS
    MUL r13, r9
    ADD r20, r13

    LDI r21, BUF
    LDI r13, 0
    ADD r13, r0
    LDI r9, COLS
    MUL r13, r9
    ADD r21, r13

    LDI r22, 0
scroll_copy:
    LOAD r13, r20
    STORE r21, r13
    ADD r20, r3
    ADD r21, r3
    ADD r22, r3
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r0, r3
    JMP scroll_loop

scroll_clear:
    LDI r20, BUF
    LDI r6, 29
    LDI r9, COLS
    MUL r6, r9
    ADD r20, r6
    LDI r6, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r6
    ADD r20, r3
    ADD r22, r3
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
