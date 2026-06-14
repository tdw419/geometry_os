;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r1, 0
    LDI r2, 0
    LDI r3, 256
    LDI r4, 256
    LDI r5, 0x000033
    RECT r1, r2, r3, r4, r5

main_loop:
    ;; Read mouse position
    MOUSEX r1       ; r1 = mouse X
    MOUSEY r2       ; r2 = mouse Y

    ;; Read button state
    MOUSEB r3       ; r3 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r5, 0xFF0000
    PIXEL r1, r2, r5         ; center pixel
    SUBI r1, 1
    PIXEL r1, r2, r5         ; -1
    SUBI r1, 1
    PIXEL r1, r2, r5         ; -2
    ADDI r1, 3
    PIXEL r1, r2, r5         ; +1
    ADDI r1, 1
    PIXEL r1, r2, r5         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r1, 2               ; restore r1 to center
    PIXEL r1, r2, r5         ; center (already drawn, harmless)
    SUBI r2, 1
    PIXEL r1, r2, r5         ; up 1
    SUBI r2, 1
    PIXEL r1, r2, r5         ; up 2
    ADDI r2, 3
    PIXEL r1, r2, r5         ; down 1
    ADDI r2, 1
    PIXEL r1, r2, r5         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r3, 1
    JZ r3, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r5, 0x00FF00
    PIXEL r1, r2, r5
    SUBI r1, 1
    PIXEL r1, r2, r5
    ADDI r2, 1
    ADDI r1, 1
    PIXEL r1, r2, r5
    ADDI r1, 1
    PIXEL r1, r2, r5

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r6    ; r6=event_type, r7=x, r8=y
    JZ r6, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r5, 0xFFFF00
    PIXEL r7, r8, r5
    ADDI r7, 1
    PIXEL r7, r8, r5
    ADDI r8, 1
    PIXEL r7, r8, r5
    SUBI r7, 1
    PIXEL r7, r8, r5

wait_frame:
    ;; Small delay loop
    LDI r9, 100
delay:
    SUBI r9, 1
    JNZ r9, delay

    JMP main_loop
