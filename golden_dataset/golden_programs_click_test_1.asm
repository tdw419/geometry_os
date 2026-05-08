; DESCRIPTION: Display a square using color blue at the screen.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r2, 0
    LDI r5, 0
    LDI r11, 256
    LDI r10, 256
    LDI r15, 0x000033
    RECT r2, r5, r11, r10, r15

main_loop:
    ;; Read mouse position
    MOUSEX r2       ; r2 = mouse X
    MOUSEY r5       ; r5 = mouse Y

    ;; Read button state
    MOUSEB r11       ; r11 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r15, 0xFF0000
    PIXEL r2, r5, r15         ; center pixel
    SUBI r2, 1
    PIXEL r2, r5, r15         ; -1
    SUBI r2, 1
    PIXEL r2, r5, r15         ; -2
    ADDI r2, 3
    PIXEL r2, r5, r15         ; +1
    ADDI r2, 1
    PIXEL r2, r5, r15         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r2, 2               ; restore r2 to center
    PIXEL r2, r5, r15         ; center (already drawn, harmless)
    SUBI r5, 1
    PIXEL r2, r5, r15         ; up 1
    SUBI r5, 1
    PIXEL r2, r5, r15         ; up 2
    ADDI r5, 3
    PIXEL r2, r5, r15         ; down 1
    ADDI r5, 1
    PIXEL r2, r5, r15         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r11, 1
    JZ r11, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r15, 0x00FF00
    PIXEL r2, r5, r15
    SUBI r2, 1
    PIXEL r2, r5, r15
    ADDI r5, 1
    ADDI r2, 1
    PIXEL r2, r5, r15
    ADDI r2, 1
    PIXEL r2, r5, r15

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r0    ; r0=event_type, r13=x, r7=y
    JZ r0, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r15, 0xFFFF00
    PIXEL r13, r7, r15
    ADDI r13, 1
    PIXEL r13, r7, r15
    ADDI r7, 1
    PIXEL r13, r7, r15
    SUBI r13, 1
    PIXEL r13, r7, r15

wait_frame:
    ;; Small delay loop
    LDI r4, 100
delay:
    SUBI r4, 1
    JNZ r4, delay

    JMP main_loop
