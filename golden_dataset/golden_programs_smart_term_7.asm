; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
;   r1: CMP result (reserved)
;   r9: Key input from IKEY
;   r6: Cursor position (offset into input buffer)
;   r5: Input buffer base (0x2000)
;   r10: Response buffer base (0x2100)
;   r0: Max response length (256)
;   r7: Response length (from LLM opcode)
;   r8: Constant 1
;   r11: Constant 9 (Tab ASCII)
;   r14: Constant 10 (Enter/LF)
;   r15: Constant 8 (Backspace)
;   r13: Constant 27 (Escape)
;   r2: Loop temp
;   r4: Screen Y for text rendering
;   r12: Constant 32 (space)
;   r3: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r5, 0x2000          ; input buffer base
LDI r10, 0x2100          ; response buffer base
LDI r0, 256             ; max response length
LDI r8, 1
LDI r11, 9               ; Tab
LDI r14, 10              ; LF
LDI r15, 8              ; Backspace
LDI r13, 27             ; Escape
LDI r12, 32             ; Space
LDI r3, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r2, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r2, 0x2000
LDI r4, 0
CALL clear_input

; Write status line
LDI r2, 0x2500
LDI r4, 0x00FFFF       ; cyan
LDI r12, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r1             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r2, 0x00FF00   ; green
    LDI r4, 2           ; x
    LDI r12, 4           ; y (below title)
    LDI r3, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r2, 0xFFFFFF   ; white
    LDI r4, 2           ; x
    LDI r12, 6           ; y (below prompt)
    LDI r3, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r2, 0x00FFFF   ; cyan
    LDI r4, 2           ; x
    LDI r12, 28          ; y (bottom area)
    LDI r3, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r9
    LDI r2, 0
    ADD r2, r9
    JZ r2, main_loop_continue

    ; Check Escape
    CMP r9, r13
    JZ r1, done

    ; Check Tab (send to LLM)
    CMP r9, r11
    JZ r1, send_to_llm

    ; Check Enter (clear input)
    CMP r9, r14
    JZ r1, handle_enter

    ; Check Backspace
    CMP r9, r15
    JZ r1, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r2, 0x2000
    CALL find_end
    ; r2 = address of null terminator
    ; Check buffer not full
    LDI r4, 0x20FF
    CMP r2, r4
    BGE r1, main_loop_continue
    ; Store character
    STORE r2, r9

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r2, 0x2500
    LDI r4, 84           ; 'T'
    STORE r2, r4
    LDI r4, 104          ; 'h'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 105          ; 'i'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 110          ; 'n'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 107          ; 'k'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 105          ; 'i'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 110          ; 'n'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 103          ; 'g'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 46           ; '.'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 46           ; '.'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 46           ; '.'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 0            ; null terminate
    ADD r2, r8
    STORE r2, r4

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r5, r10, r0

    ; r1 = response length
    ; Clear input buffer for next prompt
    LDI r2, 0x2000
    CALL clear_input

    ; Update status
    LDI r2, 0x2500
    LDI r4, 68            ; 'D'
    STORE r2, r4
    LDI r4, 111           ; 'o'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 110           ; 'n'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 101           ; 'e'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 46            ; '.'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 0
    ADD r2, r8
    STORE r2, r4

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r2, 0x2000
    CALL clear_input
    LDI r2, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r2, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r4, 0x2000
    CMP r2, r4
    JZ r1, main_loop_continue
    ; Go back one and null-terminate
    SUB r2, r8
    LDI r4, 0
    STORE r2, r4
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r2, 0x222244     ; dark purple
    LDI r4, 0
    LDI r12, 0
    LDI r3, 256
    LDI r16, 12
    RECTF r4, r12, r3, r16, r2

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r2, 0x2600
    LDI r4, 83           ; 'S'
    STORE r2, r4
    LDI r4, 109          ; 'm'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 97           ; 'a'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 114          ; 'r'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 116          ; 't'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 32           ; ' '
    ADD r2, r8
    STORE r2, r4
    LDI r4, 84           ; 'T'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 101          ; 'e'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 114          ; 'r'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 109          ; 'm'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 0            ; null terminate
    ADD r2, r8
    STORE r2, r4

    ; Render with TEXT opcode
    LDI r2, 0x2600       ; source addr
    LDI r4, 4            ; x
    LDI r12, 2            ; y
    LDI r3, 0xFFFF00     ; yellow
    TEXT r4, r12, r2

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r2, 0x2500
    LDI r4, 84           ; 'T'
    STORE r2, r4
    LDI r4, 97           ; 'a'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 98           ; 'b'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 61           ; '='
    ADD r2, r8
    STORE r2, r4
    LDI r4, 65           ; 'A'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 73           ; 'I'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 32           ; ' '
    ADD r2, r8
    STORE r2, r4
    LDI r4, 32           ; ' '
    ADD r2, r8
    STORE r2, r4
    LDI r4, 69           ; 'E'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 115          ; 's'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 99           ; 'c'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 61           ; '='
    ADD r2, r8
    STORE r2, r4
    LDI r4, 81           ; 'Q'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 117          ; 'u'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 105          ; 'i'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 116          ; 't'
    ADD r2, r8
    STORE r2, r4
    LDI r4, 0            ; null terminate
    ADD r2, r8
    STORE r2, r4
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r2 = color, r4 = screen x, r12 = screen y, r3 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r3
    PUSH r2
draw_text_loop:
    LOAD r16, r3
    LDI r2, 0
    CMP r16, r2
    JZ r1, draw_text_done
    PSET r4, r12, r2
    ADD r4, r8
    ADD r3, r8
    JMP draw_text_loop
draw_text_done:
    POP r2
    POP r3
    POP r31
    RET

; --- Find null terminator in buffer ---
; r2 = start address. Returns r2 = address of null.
find_end:
    PUSH r31
    PUSH r8
find_end_loop:
    LOAD r16, r2
    LDI r4, 0
    CMP r16, r4
    JZ r1, find_end_done
    ADD r2, r8
    JMP find_end_loop
find_end_done:
    POP r8
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r2 = buffer start address
clear_input:
    PUSH r31
    PUSH r8
    PUSH r2
    LDI r4, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r2, r4
    ADD r2, r8
    LDI r12, 0
    ADD r12, r2
    LDI r3, 0x2100
    ; Only clear up to response buffer size
    CMP r12, r3
    BGE r1, clear_done
    JMP clear_loop
clear_done:
    POP r2
    POP r8
    POP r31
    RET

done:
    HALT
