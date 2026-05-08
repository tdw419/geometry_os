; DESCRIPTION: This GeOS assembly code demonstrates mouse support by drawing a crosshair at the cursor position and painting pixels on click. It uses opcodes like `MOUSEX`, `MOUSEY`, `MOUSEB`, and `MOUSECLICK` to read mouse data and handle input events, filling the background with a dark blue color and responding to left button clicks by drawing yellow squares.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r13, 0
    LDI r4, 0
    LDI r2, 256
    LDI r8, 256
    LDI r15, 0x000033
    RECT r13, r4, r2, r8, r15

main_loop:
    ;; Read mouse position
    MOUSEX r13       ; r13 = mouse X
    MOUSEY r4       ; r4 = mouse Y

    ;; Read button state
    MOUSEB r2       ; r2 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r15, 0xFF0000
    PIXEL r13, r4, r15         ; center pixel
    SUBI r13, 1
    PIXEL r13, r4, r15         ; -1
    SUBI r13, 1
    PIXEL r13, r4, r15         ; -2
    ADDI r13, 3
    PIXEL r13, r4, r15         ; +1
    ADDI r13, 1
    PIXEL r13, r4, r15         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r13, 2               ; restore r13 to center
    PIXEL r13, r4, r15         ; center (already drawn, harmless)
    SUBI r4, 1
    PIXEL r13, r4, r15         ; up 1
    SUBI r4, 1
    PIXEL r13, r4, r15         ; up 2
    ADDI r4, 3
    PIXEL r13, r4, r15         ; down 1
    ADDI r4, 1
    PIXEL r13, r4, r15         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r2, 1
    JZ r2, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r15, 0x00FF00
    PIXEL r13, r4, r15
    SUBI r13, 1
    PIXEL r13, r4, r15
    ADDI r4, 1
    ADDI r13, 1
    PIXEL r13, r4, r15
    ADDI r13, 1
    PIXEL r13, r4, r15

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r0    ; r0=event_type, r12=x, r7=y
    JZ r0, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r15, 0xFFFF00
    PIXEL r12, r7, r15
    ADDI r12, 1
    PIXEL r12, r7, r15
    ADDI r7, 1
    PIXEL r12, r7, r15
    SUBI r12, 1
    PIXEL r12, r7, r15

wait_frame:
    ;; Small delay loop
    LDI r14, 100
delay:
    SUBI r14, 1
    JNZ r14, delay

    JMP main_loop
