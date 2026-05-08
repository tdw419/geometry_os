; DESCRIPTION: This GeOS assembly code demonstrates mouse support by drawing a crosshair at the cursor position and painting pixels on click. It uses opcodes like `MOUSEX`, `MOUSEY`, `MOUSEB`, and `MOUSECLICK` to read mouse data and handle input events, filling the background with a dark blue color and responding to left button clicks by drawing yellow squares.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r11, 0
    LDI r14, 0
    LDI r5, 256
    LDI r13, 256
    LDI r0, 0x000033
    RECT r11, r14, r5, r13, r0

main_loop:
    ;; Read mouse position
    MOUSEX r11       ; r11 = mouse X
    MOUSEY r14       ; r14 = mouse Y

    ;; Read button state
    MOUSEB r5       ; r5 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r0, 0xFF0000
    PIXEL r11, r14, r0         ; center pixel
    SUBI r11, 1
    PIXEL r11, r14, r0         ; -1
    SUBI r11, 1
    PIXEL r11, r14, r0         ; -2
    ADDI r11, 3
    PIXEL r11, r14, r0         ; +1
    ADDI r11, 1
    PIXEL r11, r14, r0         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r11, 2               ; restore r11 to center
    PIXEL r11, r14, r0         ; center (already drawn, harmless)
    SUBI r14, 1
    PIXEL r11, r14, r0         ; up 1
    SUBI r14, 1
    PIXEL r11, r14, r0         ; up 2
    ADDI r14, 3
    PIXEL r11, r14, r0         ; down 1
    ADDI r14, 1
    PIXEL r11, r14, r0         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r5, 1
    JZ r5, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r0, 0x00FF00
    PIXEL r11, r14, r0
    SUBI r11, 1
    PIXEL r11, r14, r0
    ADDI r14, 1
    ADDI r11, 1
    PIXEL r11, r14, r0
    ADDI r11, 1
    PIXEL r11, r14, r0

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r2    ; r2=event_type, r9=x, r7=y
    JZ r2, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r0, 0xFFFF00
    PIXEL r9, r7, r0
    ADDI r9, 1
    PIXEL r9, r7, r0
    ADDI r7, 1
    PIXEL r9, r7, r0
    SUBI r9, 1
    PIXEL r9, r7, r0

wait_frame:
    ;; Small delay loop
    LDI r1, 100
delay:
    SUBI r1, 1
    JNZ r1, delay

    JMP main_loop
