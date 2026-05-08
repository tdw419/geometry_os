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
;   r4: CMP result (reserved)
;   r12: Key input from IKEY
;   r7: Cursor position (offset into input buffer)
;   r13: Input buffer base (0x2000)
;   r6: Response buffer base (0x2100)
;   r8: Max response length (256)
;   r10: Response length (from LLM opcode)
;   r1: Constant 1
;   r15: Constant 9 (Tab ASCII)
;   r2: Constant 10 (Enter/LF)
;   r3: Constant 8 (Backspace)
;   r11: Constant 27 (Escape)
;   r5: Loop temp
;   r14: Screen Y for text rendering
;   r9: Constant 32 (space)
;   r0: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r13, 0x2000          ; input buffer base
LDI r6, 0x2100          ; response buffer base
LDI r8, 256             ; max response length
LDI r1, 1
LDI r15, 9               ; Tab
LDI r2, 10              ; LF
LDI r3, 8              ; Backspace
LDI r11, 27             ; Escape
LDI r9, 32             ; Space
LDI r0, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r5, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r5, 0x2000
LDI r14, 0
CALL clear_input

; Write status line
LDI r5, 0x2500
LDI r14, 0x00FFFF       ; cyan
LDI r9, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r4             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r5, 0x00FF00   ; green
    LDI r14, 2           ; x
    LDI r9, 4           ; y (below title)
    LDI r0, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r5, 0xFFFFFF   ; white
    LDI r14, 2           ; x
    LDI r9, 6           ; y (below prompt)
    LDI r0, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r5, 0x00FFFF   ; cyan
    LDI r14, 2           ; x
    LDI r9, 28          ; y (bottom area)
    LDI r0, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r12
    LDI r5, 0
    ADD r5, r12
    JZ r5, main_loop_continue

    ; Check Escape
    CMP r12, r11
    JZ r4, done

    ; Check Tab (send to LLM)
    CMP r12, r15
    JZ r4, send_to_llm

    ; Check Enter (clear input)
    CMP r12, r2
    JZ r4, handle_enter

    ; Check Backspace
    CMP r12, r3
    JZ r4, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r5, 0x2000
    CALL find_end
    ; r5 = address of null terminator
    ; Check buffer not full
    LDI r14, 0x20FF
    CMP r5, r14
    BGE r4, main_loop_continue
    ; Store character
    STORE r5, r12

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r5, 0x2500
    LDI r14, 84           ; 'T'
    STORE r5, r14
    LDI r14, 104          ; 'h'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 105          ; 'i'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 110          ; 'n'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 107          ; 'k'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 105          ; 'i'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 110          ; 'n'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 103          ; 'g'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 46           ; '.'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 46           ; '.'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 46           ; '.'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 0            ; null terminate
    ADD r5, r1
    STORE r5, r14

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r13, r6, r8

    ; r4 = response length
    ; Clear input buffer for next prompt
    LDI r5, 0x2000
    CALL clear_input

    ; Update status
    LDI r5, 0x2500
    LDI r14, 68            ; 'D'
    STORE r5, r14
    LDI r14, 111           ; 'o'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 110           ; 'n'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 101           ; 'e'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 46            ; '.'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 0
    ADD r5, r1
    STORE r5, r14

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r5, 0x2000
    CALL clear_input
    LDI r5, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r5, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r14, 0x2000
    CMP r5, r14
    JZ r4, main_loop_continue
    ; Go back one and null-terminate
    SUB r5, r1
    LDI r14, 0
    STORE r5, r14
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r5, 0x222244     ; dark purple
    LDI r14, 0
    LDI r9, 0
    LDI r0, 256
    LDI r16, 12
    RECTF r14, r9, r0, r16, r5

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r5, 0x2600
    LDI r14, 83           ; 'S'
    STORE r5, r14
    LDI r14, 109          ; 'm'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 97           ; 'a'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 114          ; 'r'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 116          ; 't'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 32           ; ' '
    ADD r5, r1
    STORE r5, r14
    LDI r14, 84           ; 'T'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 101          ; 'e'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 114          ; 'r'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 109          ; 'm'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 0            ; null terminate
    ADD r5, r1
    STORE r5, r14

    ; Render with TEXT opcode
    LDI r5, 0x2600       ; source addr
    LDI r14, 4            ; x
    LDI r9, 2            ; y
    LDI r0, 0xFFFF00     ; yellow
    TEXT r14, r9, r5

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r5, 0x2500
    LDI r14, 84           ; 'T'
    STORE r5, r14
    LDI r14, 97           ; 'a'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 98           ; 'b'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 61           ; '='
    ADD r5, r1
    STORE r5, r14
    LDI r14, 65           ; 'A'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 73           ; 'I'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 32           ; ' '
    ADD r5, r1
    STORE r5, r14
    LDI r14, 32           ; ' '
    ADD r5, r1
    STORE r5, r14
    LDI r14, 69           ; 'E'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 115          ; 's'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 99           ; 'c'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 61           ; '='
    ADD r5, r1
    STORE r5, r14
    LDI r14, 81           ; 'Q'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 117          ; 'u'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 105          ; 'i'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 116          ; 't'
    ADD r5, r1
    STORE r5, r14
    LDI r14, 0            ; null terminate
    ADD r5, r1
    STORE r5, r14
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r5 = color, r14 = screen x, r9 = screen y, r0 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r0
    PUSH r5
draw_text_loop:
    LOAD r16, r0
    LDI r5, 0
    CMP r16, r5
    JZ r4, draw_text_done
    PSET r14, r9, r5
    ADD r14, r1
    ADD r0, r1
    JMP draw_text_loop
draw_text_done:
    POP r5
    POP r0
    POP r31
    RET

; --- Find null terminator in buffer ---
; r5 = start address. Returns r5 = address of null.
find_end:
    PUSH r31
    PUSH r1
find_end_loop:
    LOAD r16, r5
    LDI r14, 0
    CMP r16, r14
    JZ r4, find_end_done
    ADD r5, r1
    JMP find_end_loop
find_end_done:
    POP r1
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r5 = buffer start address
clear_input:
    PUSH r31
    PUSH r1
    PUSH r5
    LDI r14, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r5, r14
    ADD r5, r1
    LDI r9, 0
    ADD r9, r5
    LDI r0, 0x2100
    ; Only clear up to response buffer size
    CMP r9, r0
    BGE r4, clear_done
    JMP clear_loop
clear_done:
    POP r5
    POP r1
    POP r31
    RET

done:
    HALT
