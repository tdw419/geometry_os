; DESCRIPTION: A blue square centered at the screen with fixed size.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r3, 0
    LDI r4, 0
    LDI r0, 256
    LDI r9, 256
    LDI r1, 0x000033
    RECT r3, r4, r0, r9, r1

main_loop:
    ;; Read mouse position
    MOUSEX r3       ; r3 = mouse X
    MOUSEY r4       ; r4 = mouse Y

    ;; Read button state
    MOUSEB r0       ; r0 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r1, 0xFF0000
    PIXEL r3, r4, r1         ; center pixel
    SUBI r3, 1
    PIXEL r3, r4, r1         ; -1
    SUBI r3, 1
    PIXEL r3, r4, r1         ; -2
    ADDI r3, 3
    PIXEL r3, r4, r1         ; +1
    ADDI r3, 1
    PIXEL r3, r4, r1         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r3, 2               ; restore r3 to center
    PIXEL r3, r4, r1         ; center (already drawn, harmless)
    SUBI r4, 1
    PIXEL r3, r4, r1         ; up 1
    SUBI r4, 1
    PIXEL r3, r4, r1         ; up 2
    ADDI r4, 3
    PIXEL r3, r4, r1         ; down 1
    ADDI r4, 1
    PIXEL r3, r4, r1         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r0, 1
    JZ r0, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r1, 0x00FF00
    PIXEL r3, r4, r1
    SUBI r3, 1
    PIXEL r3, r4, r1
    ADDI r4, 1
    ADDI r3, 1
    PIXEL r3, r4, r1
    ADDI r3, 1
    PIXEL r3, r4, r1

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r5    ; r5=event_type, r14=x, r11=y
    JZ r5, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r1, 0xFFFF00
    PIXEL r14, r11, r1
    ADDI r14, 1
    PIXEL r14, r11, r1
    ADDI r11, 1
    PIXEL r14, r11, r1
    SUBI r14, 1
    PIXEL r14, r11, r1

wait_frame:
    ;; Small delay loop
    LDI r8, 100
delay:
    SUBI r8, 1
    JNZ r8, delay

    JMP main_loop
