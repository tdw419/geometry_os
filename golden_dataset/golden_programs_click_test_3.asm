; DESCRIPTION: This GeOS assembly code demonstrates mouse support by drawing a crosshair at the cursor position and painting pixels on click. It uses opcodes like `MOUSEX`, `MOUSEY`, `MOUSEB`, and `MOUSECLICK` to read mouse data and handle input events, filling the background with a dark blue color and responding to left button clicks by drawing yellow squares.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r9, 0
    LDI r10, 0
    LDI r1, 256
    LDI r3, 256
    LDI r5, 0x000033
    RECT r9, r10, r1, r3, r5

main_loop:
    ;; Read mouse position
    MOUSEX r9       ; r9 = mouse X
    MOUSEY r10       ; r10 = mouse Y

    ;; Read button state
    MOUSEB r1       ; r1 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r5, 0xFF0000
    PIXEL r9, r10, r5         ; center pixel
    SUBI r9, 1
    PIXEL r9, r10, r5         ; -1
    SUBI r9, 1
    PIXEL r9, r10, r5         ; -2
    ADDI r9, 3
    PIXEL r9, r10, r5         ; +1
    ADDI r9, 1
    PIXEL r9, r10, r5         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r9, 2               ; restore r9 to center
    PIXEL r9, r10, r5         ; center (already drawn, harmless)
    SUBI r10, 1
    PIXEL r9, r10, r5         ; up 1
    SUBI r10, 1
    PIXEL r9, r10, r5         ; up 2
    ADDI r10, 3
    PIXEL r9, r10, r5         ; down 1
    ADDI r10, 1
    PIXEL r9, r10, r5         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r1, 1
    JZ r1, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r5, 0x00FF00
    PIXEL r9, r10, r5
    SUBI r9, 1
    PIXEL r9, r10, r5
    ADDI r10, 1
    ADDI r9, 1
    PIXEL r9, r10, r5
    ADDI r9, 1
    PIXEL r9, r10, r5

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r7    ; r7=event_type, r8=x, r14=y
    JZ r7, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r5, 0xFFFF00
    PIXEL r8, r14, r5
    ADDI r8, 1
    PIXEL r8, r14, r5
    ADDI r14, 1
    PIXEL r8, r14, r5
    SUBI r8, 1
    PIXEL r8, r14, r5

wait_frame:
    ;; Small delay loop
    LDI r6, 100
delay:
    SUBI r6, 1
    JNZ r6, delay

    JMP main_loop
