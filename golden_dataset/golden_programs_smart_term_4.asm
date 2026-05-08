; DESCRIPTION: The GeOS assembly code implements a terminal interface with AI assistance. It allows users to type text and press Tab to send prompts to an external AI, displaying the response on screen. The code manages memory buffers for input, responses, and status messages, uses registers for various purposes including cursor position and constants, and includes functions for drawing text, handling keyboard input, and interacting with the AI via a specific opcode.

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
;   r8: CMP result (reserved)
;   r3: Key input from IKEY
;   r1: Cursor position (offset into input buffer)
;   r13: Input buffer base (0x2000)
;   r15: Response buffer base (0x2100)
;   r4: Max response length (256)
;   r9: Response length (from LLM opcode)
;   r7: Constant 1
;   r6: Constant 9 (Tab ASCII)
;   r12: Constant 10 (Enter/LF)
;   r2: Constant 8 (Backspace)
;   r5: Constant 27 (Escape)
;   r14: Loop temp
;   r10: Screen Y for text rendering
;   r11: Constant 32 (space)
;   r0: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r13, 0x2000          ; input buffer base
LDI r15, 0x2100          ; response buffer base
LDI r4, 256             ; max response length
LDI r7, 1
LDI r6, 9               ; Tab
LDI r12, 10              ; LF
LDI r2, 8              ; Backspace
LDI r5, 27             ; Escape
LDI r11, 32             ; Space
LDI r0, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r14, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r14, 0x2000
LDI r10, 0
CALL clear_input

; Write status line
LDI r14, 0x2500
LDI r10, 0x00FFFF       ; cyan
LDI r11, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r8             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r14, 0x00FF00   ; green
    LDI r10, 2           ; x
    LDI r11, 4           ; y (below title)
    LDI r0, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r14, 0xFFFFFF   ; white
    LDI r10, 2           ; x
    LDI r11, 6           ; y (below prompt)
    LDI r0, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r14, 0x00FFFF   ; cyan
    LDI r10, 2           ; x
    LDI r11, 28          ; y (bottom area)
    LDI r0, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r3
    LDI r14, 0
    ADD r14, r3
    JZ r14, main_loop_continue

    ; Check Escape
    CMP r3, r5
    JZ r8, done

    ; Check Tab (send to LLM)
    CMP r3, r6
    JZ r8, send_to_llm

    ; Check Enter (clear input)
    CMP r3, r12
    JZ r8, handle_enter

    ; Check Backspace
    CMP r3, r2
    JZ r8, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r14, 0x2000
    CALL find_end
    ; r14 = address of null terminator
    ; Check buffer not full
    LDI r10, 0x20FF
    CMP r14, r10
    BGE r8, main_loop_continue
    ; Store character
    STORE r14, r3

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r14, 0x2500
    LDI r10, 84           ; 'T'
    STORE r14, r10
    LDI r10, 104          ; 'h'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 105          ; 'i'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 110          ; 'n'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 107          ; 'k'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 105          ; 'i'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 110          ; 'n'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 103          ; 'g'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 46           ; '.'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 46           ; '.'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 46           ; '.'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 0            ; null terminate
    ADD r14, r7
    STORE r14, r10

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r13, r15, r4

    ; r8 = response length
    ; Clear input buffer for next prompt
    LDI r14, 0x2000
    CALL clear_input

    ; Update status
    LDI r14, 0x2500
    LDI r10, 68            ; 'D'
    STORE r14, r10
    LDI r10, 111           ; 'o'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 110           ; 'n'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 101           ; 'e'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 46            ; '.'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 0
    ADD r14, r7
    STORE r14, r10

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r14, 0x2000
    CALL clear_input
    LDI r14, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r14, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r10, 0x2000
    CMP r14, r10
    JZ r8, main_loop_continue
    ; Go back one and null-terminate
    SUB r14, r7
    LDI r10, 0
    STORE r14, r10
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r14, 0x222244     ; dark purple
    LDI r10, 0
    LDI r11, 0
    LDI r0, 256
    LDI r16, 12
    RECTF r10, r11, r0, r16, r14

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r14, 0x2600
    LDI r10, 83           ; 'S'
    STORE r14, r10
    LDI r10, 109          ; 'm'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 97           ; 'a'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 114          ; 'r'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 116          ; 't'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 32           ; ' '
    ADD r14, r7
    STORE r14, r10
    LDI r10, 84           ; 'T'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 101          ; 'e'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 114          ; 'r'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 109          ; 'm'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 0            ; null terminate
    ADD r14, r7
    STORE r14, r10

    ; Render with TEXT opcode
    LDI r14, 0x2600       ; source addr
    LDI r10, 4            ; x
    LDI r11, 2            ; y
    LDI r0, 0xFFFF00     ; yellow
    TEXT r10, r11, r14

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r14, 0x2500
    LDI r10, 84           ; 'T'
    STORE r14, r10
    LDI r10, 97           ; 'a'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 98           ; 'b'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 61           ; '='
    ADD r14, r7
    STORE r14, r10
    LDI r10, 65           ; 'A'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 73           ; 'I'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 32           ; ' '
    ADD r14, r7
    STORE r14, r10
    LDI r10, 32           ; ' '
    ADD r14, r7
    STORE r14, r10
    LDI r10, 69           ; 'E'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 115          ; 's'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 99           ; 'c'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 61           ; '='
    ADD r14, r7
    STORE r14, r10
    LDI r10, 81           ; 'Q'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 117          ; 'u'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 105          ; 'i'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 116          ; 't'
    ADD r14, r7
    STORE r14, r10
    LDI r10, 0            ; null terminate
    ADD r14, r7
    STORE r14, r10
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r14 = color, r10 = screen x, r11 = screen y, r0 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r0
    PUSH r14
draw_text_loop:
    LOAD r16, r0
    LDI r14, 0
    CMP r16, r14
    JZ r8, draw_text_done
    PSET r10, r11, r14
    ADD r10, r7
    ADD r0, r7
    JMP draw_text_loop
draw_text_done:
    POP r14
    POP r0
    POP r31
    RET

; --- Find null terminator in buffer ---
; r14 = start address. Returns r14 = address of null.
find_end:
    PUSH r31
    PUSH r7
find_end_loop:
    LOAD r16, r14
    LDI r10, 0
    CMP r16, r10
    JZ r8, find_end_done
    ADD r14, r7
    JMP find_end_loop
find_end_done:
    POP r7
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r14 = buffer start address
clear_input:
    PUSH r31
    PUSH r7
    PUSH r14
    LDI r10, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r14, r10
    ADD r14, r7
    LDI r11, 0
    ADD r11, r14
    LDI r0, 0x2100
    ; Only clear up to response buffer size
    CMP r11, r0
    BGE r8, clear_done
    JMP clear_loop
clear_done:
    POP r14
    POP r7
    POP r31
    RET

done:
    HALT
