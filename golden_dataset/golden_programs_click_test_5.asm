; DESCRIPTION: Draws a blue square at the screen with fixed size.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r6, 0
    LDI r5, 0
    LDI r7, 256
    LDI r2, 256
    LDI r13, 0x000033
    RECT r6, r5, r7, r2, r13

main_loop:
    ;; Read mouse position
    MOUSEX r6       ; r6 = mouse X
    MOUSEY r5       ; r5 = mouse Y

    ;; Read button state
    MOUSEB r7       ; r7 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r13, 0xFF0000
    PIXEL r6, r5, r13         ; center pixel
    SUBI r6, 1
    PIXEL r6, r5, r13         ; -1
    SUBI r6, 1
    PIXEL r6, r5, r13         ; -2
    ADDI r6, 3
    PIXEL r6, r5, r13         ; +1
    ADDI r6, 1
    PIXEL r6, r5, r13         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r6, 2               ; restore r6 to center
    PIXEL r6, r5, r13         ; center (already drawn, harmless)
    SUBI r5, 1
    PIXEL r6, r5, r13         ; up 1
    SUBI r5, 1
    PIXEL r6, r5, r13         ; up 2
    ADDI r5, 3
    PIXEL r6, r5, r13         ; down 1
    ADDI r5, 1
    PIXEL r6, r5, r13         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r7, 1
    JZ r7, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r13, 0x00FF00
    PIXEL r6, r5, r13
    SUBI r6, 1
    PIXEL r6, r5, r13
    ADDI r5, 1
    ADDI r6, 1
    PIXEL r6, r5, r13
    ADDI r6, 1
    PIXEL r6, r5, r13

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r3    ; r3=event_type, r0=x, r8=y
    JZ r3, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r13, 0xFFFF00
    PIXEL r0, r8, r13
    ADDI r0, 1
    PIXEL r0, r8, r13
    ADDI r8, 1
    PIXEL r0, r8, r13
    SUBI r0, 1
    PIXEL r0, r8, r13

wait_frame:
    ;; Small delay loop
    LDI r9, 100
delay:
    SUBI r9, 1
    JNZ r9, delay

    JMP main_loop
