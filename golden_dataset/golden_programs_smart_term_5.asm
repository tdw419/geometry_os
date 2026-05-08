; DESCRIPTION: A colored object centered at the screen with fixed size.

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
;   r12: CMP result (reserved)
;   r14: Key input from IKEY
;   r5: Cursor position (offset into input buffer)
;   r3: Input buffer base (0x2000)
;   r11: Response buffer base (0x2100)
;   r2: Max response length (256)
;   r0: Response length (from LLM opcode)
;   r13: Constant 1
;   r4: Constant 9 (Tab ASCII)
;   r8: Constant 10 (Enter/LF)
;   r7: Constant 8 (Backspace)
;   r6: Constant 27 (Escape)
;   r9: Loop temp
;   r10: Screen Y for text rendering
;   r15: Constant 32 (space)
;   r1: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r3, 0x2000          ; input buffer base
LDI r11, 0x2100          ; response buffer base
LDI r2, 256             ; max response length
LDI r13, 1
LDI r4, 9               ; Tab
LDI r8, 10              ; LF
LDI r7, 8              ; Backspace
LDI r6, 27             ; Escape
LDI r15, 32             ; Space
LDI r1, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r9, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r9, 0x2000
LDI r10, 0
CALL clear_input

; Write status line
LDI r9, 0x2500
LDI r10, 0x00FFFF       ; cyan
LDI r15, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r12             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r9, 0x00FF00   ; green
    LDI r10, 2           ; x
    LDI r15, 4           ; y (below title)
    LDI r1, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r9, 0xFFFFFF   ; white
    LDI r10, 2           ; x
    LDI r15, 6           ; y (below prompt)
    LDI r1, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r9, 0x00FFFF   ; cyan
    LDI r10, 2           ; x
    LDI r15, 28          ; y (bottom area)
    LDI r1, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r14
    LDI r9, 0
    ADD r9, r14
    JZ r9, main_loop_continue

    ; Check Escape
    CMP r14, r6
    JZ r12, done

    ; Check Tab (send to LLM)
    CMP r14, r4
    JZ r12, send_to_llm

    ; Check Enter (clear input)
    CMP r14, r8
    JZ r12, handle_enter

    ; Check Backspace
    CMP r14, r7
    JZ r12, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r9, 0x2000
    CALL find_end
    ; r9 = address of null terminator
    ; Check buffer not full
    LDI r10, 0x20FF
    CMP r9, r10
    BGE r12, main_loop_continue
    ; Store character
    STORE r9, r14

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r9, 0x2500
    LDI r10, 84           ; 'T'
    STORE r9, r10
    LDI r10, 104          ; 'h'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 105          ; 'i'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 110          ; 'n'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 107          ; 'k'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 105          ; 'i'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 110          ; 'n'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 103          ; 'g'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 46           ; '.'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 46           ; '.'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 46           ; '.'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 0            ; null terminate
    ADD r9, r13
    STORE r9, r10

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r3, r11, r2

    ; r12 = response length
    ; Clear input buffer for next prompt
    LDI r9, 0x2000
    CALL clear_input

    ; Update status
    LDI r9, 0x2500
    LDI r10, 68            ; 'D'
    STORE r9, r10
    LDI r10, 111           ; 'o'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 110           ; 'n'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 101           ; 'e'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 46            ; '.'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 0
    ADD r9, r13
    STORE r9, r10

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r9, 0x2000
    CALL clear_input
    LDI r9, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r9, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r10, 0x2000
    CMP r9, r10
    JZ r12, main_loop_continue
    ; Go back one and null-terminate
    SUB r9, r13
    LDI r10, 0
    STORE r9, r10
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r9, 0x222244     ; dark purple
    LDI r10, 0
    LDI r15, 0
    LDI r1, 256
    LDI r16, 12
    RECTF r10, r15, r1, r16, r9

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r9, 0x2600
    LDI r10, 83           ; 'S'
    STORE r9, r10
    LDI r10, 109          ; 'm'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 97           ; 'a'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 114          ; 'r'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 116          ; 't'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 32           ; ' '
    ADD r9, r13
    STORE r9, r10
    LDI r10, 84           ; 'T'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 101          ; 'e'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 114          ; 'r'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 109          ; 'm'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 0            ; null terminate
    ADD r9, r13
    STORE r9, r10

    ; Render with TEXT opcode
    LDI r9, 0x2600       ; source addr
    LDI r10, 4            ; x
    LDI r15, 2            ; y
    LDI r1, 0xFFFF00     ; yellow
    TEXT r10, r15, r9

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r9, 0x2500
    LDI r10, 84           ; 'T'
    STORE r9, r10
    LDI r10, 97           ; 'a'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 98           ; 'b'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 61           ; '='
    ADD r9, r13
    STORE r9, r10
    LDI r10, 65           ; 'A'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 73           ; 'I'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 32           ; ' '
    ADD r9, r13
    STORE r9, r10
    LDI r10, 32           ; ' '
    ADD r9, r13
    STORE r9, r10
    LDI r10, 69           ; 'E'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 115          ; 's'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 99           ; 'c'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 61           ; '='
    ADD r9, r13
    STORE r9, r10
    LDI r10, 81           ; 'Q'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 117          ; 'u'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 105          ; 'i'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 116          ; 't'
    ADD r9, r13
    STORE r9, r10
    LDI r10, 0            ; null terminate
    ADD r9, r13
    STORE r9, r10
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r9 = color, r10 = screen x, r15 = screen y, r1 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r1
    PUSH r9
draw_text_loop:
    LOAD r16, r1
    LDI r9, 0
    CMP r16, r9
    JZ r12, draw_text_done
    PSET r10, r15, r9
    ADD r10, r13
    ADD r1, r13
    JMP draw_text_loop
draw_text_done:
    POP r9
    POP r1
    POP r31
    RET

; --- Find null terminator in buffer ---
; r9 = start address. Returns r9 = address of null.
find_end:
    PUSH r31
    PUSH r13
find_end_loop:
    LOAD r16, r9
    LDI r10, 0
    CMP r16, r10
    JZ r12, find_end_done
    ADD r9, r13
    JMP find_end_loop
find_end_done:
    POP r13
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r9 = buffer start address
clear_input:
    PUSH r31
    PUSH r13
    PUSH r9
    LDI r10, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r9, r10
    ADD r9, r13
    LDI r15, 0
    ADD r15, r9
    LDI r1, 0x2100
    ; Only clear up to response buffer size
    CMP r15, r1
    BGE r12, clear_done
    JMP clear_loop
clear_done:
    POP r9
    POP r13
    POP r31
    RET

done:
    HALT
