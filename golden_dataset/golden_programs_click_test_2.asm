; DESCRIPTION: Draws a blue square at the screen with fixed size.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r14, 0
    LDI r5, 0
    LDI r0, 256
    LDI r4, 256
    LDI r6, 0x000033
    RECT r14, r5, r0, r4, r6

main_loop:
    ;; Read mouse position
    MOUSEX r14       ; r14 = mouse X
    MOUSEY r5       ; r5 = mouse Y

    ;; Read button state
    MOUSEB r0       ; r0 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r6, 0xFF0000
    PIXEL r14, r5, r6         ; center pixel
    SUBI r14, 1
    PIXEL r14, r5, r6         ; -1
    SUBI r14, 1
    PIXEL r14, r5, r6         ; -2
    ADDI r14, 3
    PIXEL r14, r5, r6         ; +1
    ADDI r14, 1
    PIXEL r14, r5, r6         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r14, 2               ; restore r14 to center
    PIXEL r14, r5, r6         ; center (already drawn, harmless)
    SUBI r5, 1
    PIXEL r14, r5, r6         ; up 1
    SUBI r5, 1
    PIXEL r14, r5, r6         ; up 2
    ADDI r5, 3
    PIXEL r14, r5, r6         ; down 1
    ADDI r5, 1
    PIXEL r14, r5, r6         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r0, 1
    JZ r0, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r6, 0x00FF00
    PIXEL r14, r5, r6
    SUBI r14, 1
    PIXEL r14, r5, r6
    ADDI r5, 1
    ADDI r14, 1
    PIXEL r14, r5, r6
    ADDI r14, 1
    PIXEL r14, r5, r6

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r15    ; r15=event_type, r10=x, r13=y
    JZ r15, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r6, 0xFFFF00
    PIXEL r10, r13, r6
    ADDI r10, 1
    PIXEL r10, r13, r6
    ADDI r13, 1
    PIXEL r10, r13, r6
    SUBI r10, 1
    PIXEL r10, r13, r6

wait_frame:
    ;; Small delay loop
    LDI r2, 100
delay:
    SUBI r2, 1
    JNZ r2, delay

    JMP main_loop
