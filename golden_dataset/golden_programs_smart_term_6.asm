; DESCRIPTION: Geometry OS program to draw a colored object.

; smart_term.asm -- Terminal with AI assist
; Type text, press Tab to ask the LLM, response appears on screen.
; Uses LLM opcode (0x9C) to send prompts to external AI.
;
; Memory layout:
;   0x2000-0x20FF: Input buffer (prompt typed by user)
;   0x2100-0x24FF: Response buffer (LLM response, up to 1K chars)
;   0x2500-0x25FF: Status line text
;
; Registers:
;   r15: CMP result (reserved)
;   r2: Key input from IKEY
;   r13: Cursor position (offset into input buffer)
;   r10: Input buffer base (0x2000)
;   r11: Response buffer base (0x2100)
;   r6: Max response length (256)
;   r8: Response length (from LLM opcode)
;   r7: Constant 1
;   r0: Constant 9 (Tab ASCII)
;   r14: Constant 10 (Enter/LF)
;   r5: Constant 8 (Backspace)
;   r3: Constant 27 (Escape)
;   r1: Loop temp
;   r4: Screen Y for text rendering
;   r9: Constant 32 (space)
;   r12: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r10, 0x2000          ; input buffer base
LDI r11, 0x2100          ; response buffer base
LDI r6, 256             ; max response length
LDI r7, 1
LDI r0, 9               ; Tab
LDI r14, 10              ; LF
LDI r5, 8              ; Backspace
LDI r3, 27             ; Escape
LDI r9, 32             ; Space
LDI r12, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r1, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r1, 0x2000
LDI r4, 0
CALL clear_input

; Write status line
LDI r1, 0x2500
LDI r4, 0x00FFFF       ; cyan
LDI r9, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r15             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r1, 0x00FF00   ; green
    LDI r4, 2           ; x
    LDI r9, 4           ; y (below title)
    LDI r12, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r1, 0xFFFFFF   ; white
    LDI r4, 2           ; x
    LDI r9, 6           ; y (below prompt)
    LDI r12, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r1, 0x00FFFF   ; cyan
    LDI r4, 2           ; x
    LDI r9, 28          ; y (bottom area)
    LDI r12, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r2
    LDI r1, 0
    ADD r1, r2
    JZ r1, main_loop_continue

    ; Check Escape
    CMP r2, r3
    JZ r15, done

    ; Check Tab (send to LLM)
    CMP r2, r0
    JZ r15, send_to_llm

    ; Check Enter (clear input)
    CMP r2, r14
    JZ r15, handle_enter

    ; Check Backspace
    CMP r2, r5
    JZ r15, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r1, 0x2000
    CALL find_end
    ; r1 = address of null terminator
    ; Check buffer not full
    LDI r4, 0x20FF
    CMP r1, r4
    BGE r15, main_loop_continue
    ; Store character
    STORE r1, r2

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r1, 0x2500
    LDI r4, 84           ; 'T'
    STORE r1, r4
    LDI r4, 104          ; 'h'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 105          ; 'i'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 110          ; 'n'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 107          ; 'k'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 105          ; 'i'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 110          ; 'n'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 103          ; 'g'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 46           ; '.'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 46           ; '.'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 46           ; '.'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 0            ; null terminate
    ADD r1, r7
    STORE r1, r4

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r10, r11, r6

    ; r15 = response length
    ; Clear input buffer for next prompt
    LDI r1, 0x2000
    CALL clear_input

    ; Update status
    LDI r1, 0x2500
    LDI r4, 68            ; 'D'
    STORE r1, r4
    LDI r4, 111           ; 'o'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 110           ; 'n'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 101           ; 'e'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 46            ; '.'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 0
    ADD r1, r7
    STORE r1, r4

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r1, 0x2000
    CALL clear_input
    LDI r1, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r1, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r4, 0x2000
    CMP r1, r4
    JZ r15, main_loop_continue
    ; Go back one and null-terminate
    SUB r1, r7
    LDI r4, 0
    STORE r1, r4
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r1, 0x222244     ; dark purple
    LDI r4, 0
    LDI r9, 0
    LDI r12, 256
    LDI r16, 12
    RECTF r4, r9, r12, r16, r1

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r1, 0x2600
    LDI r4, 83           ; 'S'
    STORE r1, r4
    LDI r4, 109          ; 'm'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 97           ; 'a'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 114          ; 'r'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 116          ; 't'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 32           ; ' '
    ADD r1, r7
    STORE r1, r4
    LDI r4, 84           ; 'T'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 101          ; 'e'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 114          ; 'r'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 109          ; 'm'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 0            ; null terminate
    ADD r1, r7
    STORE r1, r4

    ; Render with TEXT opcode
    LDI r1, 0x2600       ; source addr
    LDI r4, 4            ; x
    LDI r9, 2            ; y
    LDI r12, 0xFFFF00     ; yellow
    TEXT r4, r9, r1

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r1, 0x2500
    LDI r4, 84           ; 'T'
    STORE r1, r4
    LDI r4, 97           ; 'a'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 98           ; 'b'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 61           ; '='
    ADD r1, r7
    STORE r1, r4
    LDI r4, 65           ; 'A'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 73           ; 'I'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 32           ; ' '
    ADD r1, r7
    STORE r1, r4
    LDI r4, 32           ; ' '
    ADD r1, r7
    STORE r1, r4
    LDI r4, 69           ; 'E'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 115          ; 's'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 99           ; 'c'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 61           ; '='
    ADD r1, r7
    STORE r1, r4
    LDI r4, 81           ; 'Q'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 117          ; 'u'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 105          ; 'i'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 116          ; 't'
    ADD r1, r7
    STORE r1, r4
    LDI r4, 0            ; null terminate
    ADD r1, r7
    STORE r1, r4
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r1 = color, r4 = screen x, r9 = screen y, r12 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r12
    PUSH r1
draw_text_loop:
    LOAD r16, r12
    LDI r1, 0
    CMP r16, r1
    JZ r15, draw_text_done
    PSET r4, r9, r1
    ADD r4, r7
    ADD r12, r7
    JMP draw_text_loop
draw_text_done:
    POP r1
    POP r12
    POP r31
    RET

; --- Find null terminator in buffer ---
; r1 = start address. Returns r1 = address of null.
find_end:
    PUSH r31
    PUSH r7
find_end_loop:
    LOAD r16, r1
    LDI r4, 0
    CMP r16, r4
    JZ r15, find_end_done
    ADD r1, r7
    JMP find_end_loop
find_end_done:
    POP r7
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r1 = buffer start address
clear_input:
    PUSH r31
    PUSH r7
    PUSH r1
    LDI r4, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r1, r4
    ADD r1, r7
    LDI r9, 0
    ADD r9, r1
    LDI r12, 0x2100
    ; Only clear up to response buffer size
    CMP r9, r12
    BGE r15, clear_done
    JMP clear_loop
clear_done:
    POP r1
    POP r7
    POP r31
    RET

done:
    HALT
