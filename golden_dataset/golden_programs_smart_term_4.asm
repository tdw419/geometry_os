; DESCRIPTION: Display a object using color colored at the screen.

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
;   r0: CMP result (reserved)
;   r14: Key input from IKEY
;   r13: Cursor position (offset into input buffer)
;   r2: Input buffer base (0x2000)
;   r3: Response buffer base (0x2100)
;   r4: Max response length (256)
;   r7: Response length (from LLM opcode)
;   r11: Constant 1
;   r12: Constant 9 (Tab ASCII)
;   r1: Constant 10 (Enter/LF)
;   r10: Constant 8 (Backspace)
;   r5: Constant 27 (Escape)
;   r8: Loop temp
;   r9: Screen Y for text rendering
;   r15: Constant 32 (space)
;   r6: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r2, 0x2000          ; input buffer base
LDI r3, 0x2100          ; response buffer base
LDI r4, 256             ; max response length
LDI r11, 1
LDI r12, 9               ; Tab
LDI r1, 10              ; LF
LDI r10, 8              ; Backspace
LDI r5, 27             ; Escape
LDI r15, 32             ; Space
LDI r6, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r8, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r8, 0x2000
LDI r9, 0
CALL clear_input

; Write status line
LDI r8, 0x2500
LDI r9, 0x00FFFF       ; cyan
LDI r15, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r0             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r8, 0x00FF00   ; green
    LDI r9, 2           ; x
    LDI r15, 4           ; y (below title)
    LDI r6, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r8, 0xFFFFFF   ; white
    LDI r9, 2           ; x
    LDI r15, 6           ; y (below prompt)
    LDI r6, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r8, 0x00FFFF   ; cyan
    LDI r9, 2           ; x
    LDI r15, 28          ; y (bottom area)
    LDI r6, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r14
    LDI r8, 0
    ADD r8, r14
    JZ r8, main_loop_continue

    ; Check Escape
    CMP r14, r5
    JZ r0, done

    ; Check Tab (send to LLM)
    CMP r14, r12
    JZ r0, send_to_llm

    ; Check Enter (clear input)
    CMP r14, r1
    JZ r0, handle_enter

    ; Check Backspace
    CMP r14, r10
    JZ r0, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r8, 0x2000
    CALL find_end
    ; r8 = address of null terminator
    ; Check buffer not full
    LDI r9, 0x20FF
    CMP r8, r9
    BGE r0, main_loop_continue
    ; Store character
    STORE r8, r14

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r8, 0x2500
    LDI r9, 84           ; 'T'
    STORE r8, r9
    LDI r9, 104          ; 'h'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 105          ; 'i'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 110          ; 'n'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 107          ; 'k'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 105          ; 'i'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 110          ; 'n'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 103          ; 'g'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 46           ; '.'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 46           ; '.'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 46           ; '.'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 0            ; null terminate
    ADD r8, r11
    STORE r8, r9

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r2, r3, r4

    ; r0 = response length
    ; Clear input buffer for next prompt
    LDI r8, 0x2000
    CALL clear_input

    ; Update status
    LDI r8, 0x2500
    LDI r9, 68            ; 'D'
    STORE r8, r9
    LDI r9, 111           ; 'o'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 110           ; 'n'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 101           ; 'e'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 46            ; '.'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 0
    ADD r8, r11
    STORE r8, r9

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r8, 0x2000
    CALL clear_input
    LDI r8, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r8, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r9, 0x2000
    CMP r8, r9
    JZ r0, main_loop_continue
    ; Go back one and null-terminate
    SUB r8, r11
    LDI r9, 0
    STORE r8, r9
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r8, 0x222244     ; dark purple
    LDI r9, 0
    LDI r15, 0
    LDI r6, 256
    LDI r16, 12
    RECTF r9, r15, r6, r16, r8

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r8, 0x2600
    LDI r9, 83           ; 'S'
    STORE r8, r9
    LDI r9, 109          ; 'm'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 97           ; 'a'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 114          ; 'r'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 116          ; 't'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 32           ; ' '
    ADD r8, r11
    STORE r8, r9
    LDI r9, 84           ; 'T'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 101          ; 'e'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 114          ; 'r'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 109          ; 'm'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 0            ; null terminate
    ADD r8, r11
    STORE r8, r9

    ; Render with TEXT opcode
    LDI r8, 0x2600       ; source addr
    LDI r9, 4            ; x
    LDI r15, 2            ; y
    LDI r6, 0xFFFF00     ; yellow
    TEXT r9, r15, r8

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r8, 0x2500
    LDI r9, 84           ; 'T'
    STORE r8, r9
    LDI r9, 97           ; 'a'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 98           ; 'b'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 61           ; '='
    ADD r8, r11
    STORE r8, r9
    LDI r9, 65           ; 'A'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 73           ; 'I'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 32           ; ' '
    ADD r8, r11
    STORE r8, r9
    LDI r9, 32           ; ' '
    ADD r8, r11
    STORE r8, r9
    LDI r9, 69           ; 'E'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 115          ; 's'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 99           ; 'c'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 61           ; '='
    ADD r8, r11
    STORE r8, r9
    LDI r9, 81           ; 'Q'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 117          ; 'u'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 105          ; 'i'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 116          ; 't'
    ADD r8, r11
    STORE r8, r9
    LDI r9, 0            ; null terminate
    ADD r8, r11
    STORE r8, r9
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r8 = color, r9 = screen x, r15 = screen y, r6 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r6
    PUSH r8
draw_text_loop:
    LOAD r16, r6
    LDI r8, 0
    CMP r16, r8
    JZ r0, draw_text_done
    PSET r9, r15, r8
    ADD r9, r11
    ADD r6, r11
    JMP draw_text_loop
draw_text_done:
    POP r8
    POP r6
    POP r31
    RET

; --- Find null terminator in buffer ---
; r8 = start address. Returns r8 = address of null.
find_end:
    PUSH r31
    PUSH r11
find_end_loop:
    LOAD r16, r8
    LDI r9, 0
    CMP r16, r9
    JZ r0, find_end_done
    ADD r8, r11
    JMP find_end_loop
find_end_done:
    POP r11
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r8 = buffer start address
clear_input:
    PUSH r31
    PUSH r11
    PUSH r8
    LDI r9, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r8, r9
    ADD r8, r11
    LDI r15, 0
    ADD r15, r8
    LDI r6, 0x2100
    ; Only clear up to response buffer size
    CMP r15, r6
    BGE r0, clear_done
    JMP clear_loop
clear_done:
    POP r8
    POP r11
    POP r31
    RET

done:
    HALT
