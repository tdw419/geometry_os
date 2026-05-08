; DESCRIPTION: This GeOS assembly code demonstrates mouse support by drawing a crosshair at the cursor position and painting pixels on click. It uses opcodes like `MOUSEX`, `MOUSEY`, `MOUSEB`, and `MOUSECLICK` to read mouse data and handle input events, filling the background with a dark blue color and responding to left button clicks by drawing yellow squares.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r5, 0
    LDI r9, 0
    LDI r2, 256
    LDI r0, 256
    LDI r15, 0x000033
    RECT r5, r9, r2, r0, r15

main_loop:
    ;; Read mouse position
    MOUSEX r5       ; r5 = mouse X
    MOUSEY r9       ; r9 = mouse Y

    ;; Read button state
    MOUSEB r2       ; r2 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r15, 0xFF0000
    PIXEL r5, r9, r15         ; center pixel
    SUBI r5, 1
    PIXEL r5, r9, r15         ; -1
    SUBI r5, 1
    PIXEL r5, r9, r15         ; -2
    ADDI r5, 3
    PIXEL r5, r9, r15         ; +1
    ADDI r5, 1
    PIXEL r5, r9, r15         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r5, 2               ; restore r5 to center
    PIXEL r5, r9, r15         ; center (already drawn, harmless)
    SUBI r9, 1
    PIXEL r5, r9, r15         ; up 1
    SUBI r9, 1
    PIXEL r5, r9, r15         ; up 2
    ADDI r9, 3
    PIXEL r5, r9, r15         ; down 1
    ADDI r9, 1
    PIXEL r5, r9, r15         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r2, 1
    JZ r2, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r15, 0x00FF00
    PIXEL r5, r9, r15
    SUBI r5, 1
    PIXEL r5, r9, r15
    ADDI r9, 1
    ADDI r5, 1
    PIXEL r5, r9, r15
    ADDI r5, 1
    PIXEL r5, r9, r15

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r4    ; r4=event_type, r3=x, r10=y
    JZ r4, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r15, 0xFFFF00
    PIXEL r3, r10, r15
    ADDI r3, 1
    PIXEL r3, r10, r15
    ADDI r10, 1
    PIXEL r3, r10, r15
    SUBI r3, 1
    PIXEL r3, r10, r15

wait_frame:
    ;; Small delay loop
    LDI r13, 100
delay:
    SUBI r13, 1
    JNZ r13, delay

    JMP main_loop
