; DESCRIPTION: This GeOS assembly code demonstrates mouse support by drawing a crosshair at the cursor position and painting pixels on click. It uses opcodes like `MOUSEX`, `MOUSEY`, `MOUSEB`, and `MOUSECLICK` to read mouse data and handle input events, filling the background with a dark blue color and responding to left button clicks by drawing yellow squares.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r11, 0
    LDI r5, 0
    LDI r2, 256
    LDI r8, 256
    LDI r14, 0x000033
    RECT r11, r5, r2, r8, r14

main_loop:
    ;; Read mouse position
    MOUSEX r11       ; r11 = mouse X
    MOUSEY r5       ; r5 = mouse Y

    ;; Read button state
    MOUSEB r2       ; r2 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r14, 0xFF0000
    PIXEL r11, r5, r14         ; center pixel
    SUBI r11, 1
    PIXEL r11, r5, r14         ; -1
    SUBI r11, 1
    PIXEL r11, r5, r14         ; -2
    ADDI r11, 3
    PIXEL r11, r5, r14         ; +1
    ADDI r11, 1
    PIXEL r11, r5, r14         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r11, 2               ; restore r11 to center
    PIXEL r11, r5, r14         ; center (already drawn, harmless)
    SUBI r5, 1
    PIXEL r11, r5, r14         ; up 1
    SUBI r5, 1
    PIXEL r11, r5, r14         ; up 2
    ADDI r5, 3
    PIXEL r11, r5, r14         ; down 1
    ADDI r5, 1
    PIXEL r11, r5, r14         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r2, 1
    JZ r2, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r14, 0x00FF00
    PIXEL r11, r5, r14
    SUBI r11, 1
    PIXEL r11, r5, r14
    ADDI r5, 1
    ADDI r11, 1
    PIXEL r11, r5, r14
    ADDI r11, 1
    PIXEL r11, r5, r14

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r12    ; r12=event_type, r6=x, r0=y
    JZ r12, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r14, 0xFFFF00
    PIXEL r6, r0, r14
    ADDI r6, 1
    PIXEL r6, r0, r14
    ADDI r0, 1
    PIXEL r6, r0, r14
    SUBI r6, 1
    PIXEL r6, r0, r14

wait_frame:
    ;; Small delay loop
    LDI r10, 100
delay:
    SUBI r10, 1
    JNZ r10, delay

    JMP main_loop
