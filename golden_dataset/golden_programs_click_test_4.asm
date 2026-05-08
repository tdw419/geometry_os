; DESCRIPTION: Render a blue square at the screen.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r13, 0
    LDI r14, 0
    LDI r10, 256
    LDI r4, 256
    LDI r11, 0x000033
    RECT r13, r14, r10, r4, r11

main_loop:
    ;; Read mouse position
    MOUSEX r13       ; r13 = mouse X
    MOUSEY r14       ; r14 = mouse Y

    ;; Read button state
    MOUSEB r10       ; r10 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r11, 0xFF0000
    PIXEL r13, r14, r11         ; center pixel
    SUBI r13, 1
    PIXEL r13, r14, r11         ; -1
    SUBI r13, 1
    PIXEL r13, r14, r11         ; -2
    ADDI r13, 3
    PIXEL r13, r14, r11         ; +1
    ADDI r13, 1
    PIXEL r13, r14, r11         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r13, 2               ; restore r13 to center
    PIXEL r13, r14, r11         ; center (already drawn, harmless)
    SUBI r14, 1
    PIXEL r13, r14, r11         ; up 1
    SUBI r14, 1
    PIXEL r13, r14, r11         ; up 2
    ADDI r14, 3
    PIXEL r13, r14, r11         ; down 1
    ADDI r14, 1
    PIXEL r13, r14, r11         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r10, 1
    JZ r10, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r11, 0x00FF00
    PIXEL r13, r14, r11
    SUBI r13, 1
    PIXEL r13, r14, r11
    ADDI r14, 1
    ADDI r13, 1
    PIXEL r13, r14, r11
    ADDI r13, 1
    PIXEL r13, r14, r11

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r9    ; r9=event_type, r0=x, r2=y
    JZ r9, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r11, 0xFFFF00
    PIXEL r0, r2, r11
    ADDI r0, 1
    PIXEL r0, r2, r11
    ADDI r2, 1
    PIXEL r0, r2, r11
    SUBI r0, 1
    PIXEL r0, r2, r11

wait_frame:
    ;; Small delay loop
    LDI r15, 100
delay:
    SUBI r15, 1
    JNZ r15, delay

    JMP main_loop
