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
;   r7: CMP result (reserved)
;   r4: Key input from IKEY
;   r13: Cursor position (offset into input buffer)
;   r12: Input buffer base (0x2000)
;   r6: Response buffer base (0x2100)
;   r3: Max response length (256)
;   r2: Response length (from LLM opcode)
;   r8: Constant 1
;   r11: Constant 9 (Tab ASCII)
;   r15: Constant 10 (Enter/LF)
;   r10: Constant 8 (Backspace)
;   r1: Constant 27 (Escape)
;   r0: Loop temp
;   r9: Screen Y for text rendering
;   r14: Constant 32 (space)
;   r5: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r12, 0x2000          ; input buffer base
LDI r6, 0x2100          ; response buffer base
LDI r3, 256             ; max response length
LDI r8, 1
LDI r11, 9               ; Tab
LDI r15, 10              ; LF
LDI r10, 8              ; Backspace
LDI r1, 27             ; Escape
LDI r14, 32             ; Space
LDI r5, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r0, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r0, 0x2000
LDI r9, 0
CALL clear_input

; Write status line
LDI r0, 0x2500
LDI r9, 0x00FFFF       ; cyan
LDI r14, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r7             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r0, 0x00FF00   ; green
    LDI r9, 2           ; x
    LDI r14, 4           ; y (below title)
    LDI r5, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r0, 0xFFFFFF   ; white
    LDI r9, 2           ; x
    LDI r14, 6           ; y (below prompt)
    LDI r5, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r0, 0x00FFFF   ; cyan
    LDI r9, 2           ; x
    LDI r14, 28          ; y (bottom area)
    LDI r5, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r4
    LDI r0, 0
    ADD r0, r4
    JZ r0, main_loop_continue

    ; Check Escape
    CMP r4, r1
    JZ r7, done

    ; Check Tab (send to LLM)
    CMP r4, r11
    JZ r7, send_to_llm

    ; Check Enter (clear input)
    CMP r4, r15
    JZ r7, handle_enter

    ; Check Backspace
    CMP r4, r10
    JZ r7, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r0, 0x2000
    CALL find_end
    ; r0 = address of null terminator
    ; Check buffer not full
    LDI r9, 0x20FF
    CMP r0, r9
    BGE r7, main_loop_continue
    ; Store character
    STORE r0, r4

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r0, 0x2500
    LDI r9, 84           ; 'T'
    STORE r0, r9
    LDI r9, 104          ; 'h'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 105          ; 'i'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 110          ; 'n'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 107          ; 'k'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 105          ; 'i'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 110          ; 'n'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 103          ; 'g'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 46           ; '.'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 46           ; '.'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 46           ; '.'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 0            ; null terminate
    ADD r0, r8
    STORE r0, r9

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r12, r6, r3

    ; r7 = response length
    ; Clear input buffer for next prompt
    LDI r0, 0x2000
    CALL clear_input

    ; Update status
    LDI r0, 0x2500
    LDI r9, 68            ; 'D'
    STORE r0, r9
    LDI r9, 111           ; 'o'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 110           ; 'n'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 101           ; 'e'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 46            ; '.'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 0
    ADD r0, r8
    STORE r0, r9

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r0, 0x2000
    CALL clear_input
    LDI r0, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r0, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r9, 0x2000
    CMP r0, r9
    JZ r7, main_loop_continue
    ; Go back one and null-terminate
    SUB r0, r8
    LDI r9, 0
    STORE r0, r9
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r0, 0x222244     ; dark purple
    LDI r9, 0
    LDI r14, 0
    LDI r5, 256
    LDI r16, 12
    RECTF r9, r14, r5, r16, r0

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r0, 0x2600
    LDI r9, 83           ; 'S'
    STORE r0, r9
    LDI r9, 109          ; 'm'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 97           ; 'a'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 114          ; 'r'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 116          ; 't'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 32           ; ' '
    ADD r0, r8
    STORE r0, r9
    LDI r9, 84           ; 'T'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 101          ; 'e'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 114          ; 'r'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 109          ; 'm'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 0            ; null terminate
    ADD r0, r8
    STORE r0, r9

    ; Render with TEXT opcode
    LDI r0, 0x2600       ; source addr
    LDI r9, 4            ; x
    LDI r14, 2            ; y
    LDI r5, 0xFFFF00     ; yellow
    TEXT r9, r14, r0

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r0, 0x2500
    LDI r9, 84           ; 'T'
    STORE r0, r9
    LDI r9, 97           ; 'a'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 98           ; 'b'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 61           ; '='
    ADD r0, r8
    STORE r0, r9
    LDI r9, 65           ; 'A'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 73           ; 'I'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 32           ; ' '
    ADD r0, r8
    STORE r0, r9
    LDI r9, 32           ; ' '
    ADD r0, r8
    STORE r0, r9
    LDI r9, 69           ; 'E'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 115          ; 's'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 99           ; 'c'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 61           ; '='
    ADD r0, r8
    STORE r0, r9
    LDI r9, 81           ; 'Q'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 117          ; 'u'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 105          ; 'i'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 116          ; 't'
    ADD r0, r8
    STORE r0, r9
    LDI r9, 0            ; null terminate
    ADD r0, r8
    STORE r0, r9
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r0 = color, r9 = screen x, r14 = screen y, r5 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r5
    PUSH r0
draw_text_loop:
    LOAD r16, r5
    LDI r0, 0
    CMP r16, r0
    JZ r7, draw_text_done
    PSET r9, r14, r0
    ADD r9, r8
    ADD r5, r8
    JMP draw_text_loop
draw_text_done:
    POP r0
    POP r5
    POP r31
    RET

; --- Find null terminator in buffer ---
; r0 = start address. Returns r0 = address of null.
find_end:
    PUSH r31
    PUSH r8
find_end_loop:
    LOAD r16, r0
    LDI r9, 0
    CMP r16, r9
    JZ r7, find_end_done
    ADD r0, r8
    JMP find_end_loop
find_end_done:
    POP r8
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r0 = buffer start address
clear_input:
    PUSH r31
    PUSH r8
    PUSH r0
    LDI r9, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r0, r9
    ADD r0, r8
    LDI r14, 0
    ADD r14, r0
    LDI r5, 0x2100
    ; Only clear up to response buffer size
    CMP r14, r5
    BGE r7, clear_done
    JMP clear_loop
clear_done:
    POP r0
    POP r8
    POP r31
    RET

done:
    HALT
