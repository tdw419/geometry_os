; DESCRIPTION: This GeOS assembly code demonstrates mouse support by drawing a crosshair at the cursor position and painting pixels on click. It uses opcodes like `MOUSEX`, `MOUSEY`, `MOUSEB`, and `MOUSECLICK` to read mouse data and handle input events, filling the background with a dark blue color and responding to left button clicks by drawing yellow squares.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r2, 0
    LDI r14, 0
    LDI r9, 256
    LDI r5, 256
    LDI r7, 0x000033
    RECT r2, r14, r9, r5, r7

main_loop:
    ;; Read mouse position
    MOUSEX r2       ; r2 = mouse X
    MOUSEY r14       ; r14 = mouse Y

    ;; Read button state
    MOUSEB r9       ; r9 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r7, 0xFF0000
    PIXEL r2, r14, r7         ; center pixel
    SUBI r2, 1
    PIXEL r2, r14, r7         ; -1
    SUBI r2, 1
    PIXEL r2, r14, r7         ; -2
    ADDI r2, 3
    PIXEL r2, r14, r7         ; +1
    ADDI r2, 1
    PIXEL r2, r14, r7         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r2, 2               ; restore r2 to center
    PIXEL r2, r14, r7         ; center (already drawn, harmless)
    SUBI r14, 1
    PIXEL r2, r14, r7         ; up 1
    SUBI r14, 1
    PIXEL r2, r14, r7         ; up 2
    ADDI r14, 3
    PIXEL r2, r14, r7         ; down 1
    ADDI r14, 1
    PIXEL r2, r14, r7         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r9, 1
    JZ r9, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r7, 0x00FF00
    PIXEL r2, r14, r7
    SUBI r2, 1
    PIXEL r2, r14, r7
    ADDI r14, 1
    ADDI r2, 1
    PIXEL r2, r14, r7
    ADDI r2, 1
    PIXEL r2, r14, r7

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r0    ; r0=event_type, r6=x, r3=y
    JZ r0, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r7, 0xFFFF00
    PIXEL r6, r3, r7
    ADDI r6, 1
    PIXEL r6, r3, r7
    ADDI r3, 1
    PIXEL r6, r3, r7
    SUBI r6, 1
    PIXEL r6, r3, r7

wait_frame:
    ;; Small delay loop
    LDI r8, 100
delay:
    SUBI r8, 1
    JNZ r8, delay

    JMP main_loop
