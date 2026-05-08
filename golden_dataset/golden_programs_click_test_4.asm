; DESCRIPTION: This GeOS assembly code demonstrates mouse support by drawing a crosshair at the cursor position and painting pixels on click. It uses opcodes like `MOUSEX`, `MOUSEY`, `MOUSEB`, and `MOUSECLICK` to read mouse data and handle input events, filling the background with a dark blue color and responding to left button clicks by drawing yellow squares.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r0, 0
    LDI r1, 0
    LDI r14, 256
    LDI r4, 256
    LDI r8, 0x000033
    RECT r0, r1, r14, r4, r8

main_loop:
    ;; Read mouse position
    MOUSEX r0       ; r0 = mouse X
    MOUSEY r1       ; r1 = mouse Y

    ;; Read button state
    MOUSEB r14       ; r14 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r8, 0xFF0000
    PIXEL r0, r1, r8         ; center pixel
    SUBI r0, 1
    PIXEL r0, r1, r8         ; -1
    SUBI r0, 1
    PIXEL r0, r1, r8         ; -2
    ADDI r0, 3
    PIXEL r0, r1, r8         ; +1
    ADDI r0, 1
    PIXEL r0, r1, r8         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r0, 2               ; restore r0 to center
    PIXEL r0, r1, r8         ; center (already drawn, harmless)
    SUBI r1, 1
    PIXEL r0, r1, r8         ; up 1
    SUBI r1, 1
    PIXEL r0, r1, r8         ; up 2
    ADDI r1, 3
    PIXEL r0, r1, r8         ; down 1
    ADDI r1, 1
    PIXEL r0, r1, r8         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r14, 1
    JZ r14, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r8, 0x00FF00
    PIXEL r0, r1, r8
    SUBI r0, 1
    PIXEL r0, r1, r8
    ADDI r1, 1
    ADDI r0, 1
    PIXEL r0, r1, r8
    ADDI r0, 1
    PIXEL r0, r1, r8

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r15    ; r15=event_type, r10=x, r9=y
    JZ r15, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r8, 0xFFFF00
    PIXEL r10, r9, r8
    ADDI r10, 1
    PIXEL r10, r9, r8
    ADDI r9, 1
    PIXEL r10, r9, r8
    SUBI r10, 1
    PIXEL r10, r9, r8

wait_frame:
    ;; Small delay loop
    LDI r3, 100
delay:
    SUBI r3, 1
    JNZ r3, delay

    JMP main_loop
