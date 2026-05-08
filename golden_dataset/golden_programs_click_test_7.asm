; DESCRIPTION: Render a blue square at the screen.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r2, 0
    LDI r1, 0
    LDI r10, 256
    LDI r15, 256
    LDI r4, 0x000033
    RECT r2, r1, r10, r15, r4

main_loop:
    ;; Read mouse position
    MOUSEX r2       ; r2 = mouse X
    MOUSEY r1       ; r1 = mouse Y

    ;; Read button state
    MOUSEB r10       ; r10 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r4, 0xFF0000
    PIXEL r2, r1, r4         ; center pixel
    SUBI r2, 1
    PIXEL r2, r1, r4         ; -1
    SUBI r2, 1
    PIXEL r2, r1, r4         ; -2
    ADDI r2, 3
    PIXEL r2, r1, r4         ; +1
    ADDI r2, 1
    PIXEL r2, r1, r4         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r2, 2               ; restore r2 to center
    PIXEL r2, r1, r4         ; center (already drawn, harmless)
    SUBI r1, 1
    PIXEL r2, r1, r4         ; up 1
    SUBI r1, 1
    PIXEL r2, r1, r4         ; up 2
    ADDI r1, 3
    PIXEL r2, r1, r4         ; down 1
    ADDI r1, 1
    PIXEL r2, r1, r4         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r10, 1
    JZ r10, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r4, 0x00FF00
    PIXEL r2, r1, r4
    SUBI r2, 1
    PIXEL r2, r1, r4
    ADDI r1, 1
    ADDI r2, 1
    PIXEL r2, r1, r4
    ADDI r2, 1
    PIXEL r2, r1, r4

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r11    ; r11=event_type, r3=x, r14=y
    JZ r11, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r4, 0xFFFF00
    PIXEL r3, r14, r4
    ADDI r3, 1
    PIXEL r3, r14, r4
    ADDI r14, 1
    PIXEL r3, r14, r4
    SUBI r3, 1
    PIXEL r3, r14, r4

wait_frame:
    ;; Small delay loop
    LDI r8, 100
delay:
    SUBI r8, 1
    JNZ r8, delay

    JMP main_loop
