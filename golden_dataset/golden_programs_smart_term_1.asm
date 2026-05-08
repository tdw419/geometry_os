; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
;   r14: CMP result (reserved)
;   r10: Key input from IKEY
;   r1: Cursor position (offset into input buffer)
;   r3: Input buffer base (0x2000)
;   r5: Response buffer base (0x2100)
;   r13: Max response length (256)
;   r0: Response length (from LLM opcode)
;   r2: Constant 1
;   r4: Constant 9 (Tab ASCII)
;   r6: Constant 10 (Enter/LF)
;   r15: Constant 8 (Backspace)
;   r12: Constant 27 (Escape)
;   r11: Loop temp
;   r7: Screen Y for text rendering
;   r8: Constant 32 (space)
;   r9: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r3, 0x2000          ; input buffer base
LDI r5, 0x2100          ; response buffer base
LDI r13, 256             ; max response length
LDI r2, 1
LDI r4, 9               ; Tab
LDI r6, 10              ; LF
LDI r15, 8              ; Backspace
LDI r12, 27             ; Escape
LDI r8, 32             ; Space
LDI r9, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r11, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r11, 0x2000
LDI r7, 0
CALL clear_input

; Write status line
LDI r11, 0x2500
LDI r7, 0x00FFFF       ; cyan
LDI r8, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r14             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r11, 0x00FF00   ; green
    LDI r7, 2           ; x
    LDI r8, 4           ; y (below title)
    LDI r9, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r11, 0xFFFFFF   ; white
    LDI r7, 2           ; x
    LDI r8, 6           ; y (below prompt)
    LDI r9, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r11, 0x00FFFF   ; cyan
    LDI r7, 2           ; x
    LDI r8, 28          ; y (bottom area)
    LDI r9, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r10
    LDI r11, 0
    ADD r11, r10
    JZ r11, main_loop_continue

    ; Check Escape
    CMP r10, r12
    JZ r14, done

    ; Check Tab (send to LLM)
    CMP r10, r4
    JZ r14, send_to_llm

    ; Check Enter (clear input)
    CMP r10, r6
    JZ r14, handle_enter

    ; Check Backspace
    CMP r10, r15
    JZ r14, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r11, 0x2000
    CALL find_end
    ; r11 = address of null terminator
    ; Check buffer not full
    LDI r7, 0x20FF
    CMP r11, r7
    BGE r14, main_loop_continue
    ; Store character
    STORE r11, r10

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r11, 0x2500
    LDI r7, 84           ; 'T'
    STORE r11, r7
    LDI r7, 104          ; 'h'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 105          ; 'i'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 110          ; 'n'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 107          ; 'k'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 105          ; 'i'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 110          ; 'n'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 103          ; 'g'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 46           ; '.'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 46           ; '.'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 46           ; '.'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 0            ; null terminate
    ADD r11, r2
    STORE r11, r7

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r3, r5, r13

    ; r14 = response length
    ; Clear input buffer for next prompt
    LDI r11, 0x2000
    CALL clear_input

    ; Update status
    LDI r11, 0x2500
    LDI r7, 68            ; 'D'
    STORE r11, r7
    LDI r7, 111           ; 'o'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 110           ; 'n'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 101           ; 'e'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 46            ; '.'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 0
    ADD r11, r2
    STORE r11, r7

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r11, 0x2000
    CALL clear_input
    LDI r11, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r11, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r7, 0x2000
    CMP r11, r7
    JZ r14, main_loop_continue
    ; Go back one and null-terminate
    SUB r11, r2
    LDI r7, 0
    STORE r11, r7
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r11, 0x222244     ; dark purple
    LDI r7, 0
    LDI r8, 0
    LDI r9, 256
    LDI r16, 12
    RECTF r7, r8, r9, r16, r11

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r11, 0x2600
    LDI r7, 83           ; 'S'
    STORE r11, r7
    LDI r7, 109          ; 'm'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 97           ; 'a'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 114          ; 'r'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 116          ; 't'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 32           ; ' '
    ADD r11, r2
    STORE r11, r7
    LDI r7, 84           ; 'T'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 101          ; 'e'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 114          ; 'r'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 109          ; 'm'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 0            ; null terminate
    ADD r11, r2
    STORE r11, r7

    ; Render with TEXT opcode
    LDI r11, 0x2600       ; source addr
    LDI r7, 4            ; x
    LDI r8, 2            ; y
    LDI r9, 0xFFFF00     ; yellow
    TEXT r7, r8, r11

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r11, 0x2500
    LDI r7, 84           ; 'T'
    STORE r11, r7
    LDI r7, 97           ; 'a'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 98           ; 'b'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 61           ; '='
    ADD r11, r2
    STORE r11, r7
    LDI r7, 65           ; 'A'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 73           ; 'I'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 32           ; ' '
    ADD r11, r2
    STORE r11, r7
    LDI r7, 32           ; ' '
    ADD r11, r2
    STORE r11, r7
    LDI r7, 69           ; 'E'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 115          ; 's'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 99           ; 'c'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 61           ; '='
    ADD r11, r2
    STORE r11, r7
    LDI r7, 81           ; 'Q'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 117          ; 'u'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 105          ; 'i'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 116          ; 't'
    ADD r11, r2
    STORE r11, r7
    LDI r7, 0            ; null terminate
    ADD r11, r2
    STORE r11, r7
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r11 = color, r7 = screen x, r8 = screen y, r9 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r9
    PUSH r11
draw_text_loop:
    LOAD r16, r9
    LDI r11, 0
    CMP r16, r11
    JZ r14, draw_text_done
    PSET r7, r8, r11
    ADD r7, r2
    ADD r9, r2
    JMP draw_text_loop
draw_text_done:
    POP r11
    POP r9
    POP r31
    RET

; --- Find null terminator in buffer ---
; r11 = start address. Returns r11 = address of null.
find_end:
    PUSH r31
    PUSH r2
find_end_loop:
    LOAD r16, r11
    LDI r7, 0
    CMP r16, r7
    JZ r14, find_end_done
    ADD r11, r2
    JMP find_end_loop
find_end_done:
    POP r2
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r11 = buffer start address
clear_input:
    PUSH r31
    PUSH r2
    PUSH r11
    LDI r7, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r11, r7
    ADD r11, r2
    LDI r8, 0
    ADD r8, r11
    LDI r9, 0x2100
    ; Only clear up to response buffer size
    CMP r8, r9
    BGE r14, clear_done
    JMP clear_loop
clear_done:
    POP r11
    POP r2
    POP r31
    RET

done:
    HALT
