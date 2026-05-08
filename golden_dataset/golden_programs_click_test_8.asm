; DESCRIPTION: Geometry OS program to draw a blue square.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r5, 0
    LDI r6, 0
    LDI r8, 256
    LDI r2, 256
    LDI r3, 0x000033
    RECT r5, r6, r8, r2, r3

main_loop:
    ;; Read mouse position
    MOUSEX r5       ; r5 = mouse X
    MOUSEY r6       ; r6 = mouse Y

    ;; Read button state
    MOUSEB r8       ; r8 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r3, 0xFF0000
    PIXEL r5, r6, r3         ; center pixel
    SUBI r5, 1
    PIXEL r5, r6, r3         ; -1
    SUBI r5, 1
    PIXEL r5, r6, r3         ; -2
    ADDI r5, 3
    PIXEL r5, r6, r3         ; +1
    ADDI r5, 1
    PIXEL r5, r6, r3         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r5, 2               ; restore r5 to center
    PIXEL r5, r6, r3         ; center (already drawn, harmless)
    SUBI r6, 1
    PIXEL r5, r6, r3         ; up 1
    SUBI r6, 1
    PIXEL r5, r6, r3         ; up 2
    ADDI r6, 3
    PIXEL r5, r6, r3         ; down 1
    ADDI r6, 1
    PIXEL r5, r6, r3         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r8, 1
    JZ r8, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r3, 0x00FF00
    PIXEL r5, r6, r3
    SUBI r5, 1
    PIXEL r5, r6, r3
    ADDI r6, 1
    ADDI r5, 1
    PIXEL r5, r6, r3
    ADDI r5, 1
    PIXEL r5, r6, r3

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r0    ; r0=event_type, r15=x, r10=y
    JZ r0, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r3, 0xFFFF00
    PIXEL r15, r10, r3
    ADDI r15, 1
    PIXEL r15, r10, r3
    ADDI r10, 1
    PIXEL r15, r10, r3
    SUBI r15, 1
    PIXEL r15, r10, r3

wait_frame:
    ;; Small delay loop
    LDI r1, 100
delay:
    SUBI r1, 1
    JNZ r1, delay

    JMP main_loop
