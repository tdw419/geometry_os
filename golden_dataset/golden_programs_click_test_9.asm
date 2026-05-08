; DESCRIPTION: This GeOS assembly code demonstrates mouse support by drawing a crosshair at the cursor position and painting pixels on click. It uses opcodes like `MOUSEX`, `MOUSEY`, `MOUSEB`, and `MOUSECLICK` to read mouse data and handle input events, filling the background with a dark blue color and responding to left button clicks by drawing yellow squares.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r1, 0
    LDI r10, 0
    LDI r5, 256
    LDI r9, 256
    LDI r12, 0x000033
    RECT r1, r10, r5, r9, r12

main_loop:
    ;; Read mouse position
    MOUSEX r1       ; r1 = mouse X
    MOUSEY r10       ; r10 = mouse Y

    ;; Read button state
    MOUSEB r5       ; r5 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r12, 0xFF0000
    PIXEL r1, r10, r12         ; center pixel
    SUBI r1, 1
    PIXEL r1, r10, r12         ; -1
    SUBI r1, 1
    PIXEL r1, r10, r12         ; -2
    ADDI r1, 3
    PIXEL r1, r10, r12         ; +1
    ADDI r1, 1
    PIXEL r1, r10, r12         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r1, 2               ; restore r1 to center
    PIXEL r1, r10, r12         ; center (already drawn, harmless)
    SUBI r10, 1
    PIXEL r1, r10, r12         ; up 1
    SUBI r10, 1
    PIXEL r1, r10, r12         ; up 2
    ADDI r10, 3
    PIXEL r1, r10, r12         ; down 1
    ADDI r10, 1
    PIXEL r1, r10, r12         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r5, 1
    JZ r5, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r12, 0x00FF00
    PIXEL r1, r10, r12
    SUBI r1, 1
    PIXEL r1, r10, r12
    ADDI r10, 1
    ADDI r1, 1
    PIXEL r1, r10, r12
    ADDI r1, 1
    PIXEL r1, r10, r12

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r15    ; r15=event_type, r2=x, r3=y
    JZ r15, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r12, 0xFFFF00
    PIXEL r2, r3, r12
    ADDI r2, 1
    PIXEL r2, r3, r12
    ADDI r3, 1
    PIXEL r2, r3, r12
    SUBI r2, 1
    PIXEL r2, r3, r12

wait_frame:
    ;; Small delay loop
    LDI r8, 100
delay:
    SUBI r8, 1
    JNZ r8, delay

    JMP main_loop
