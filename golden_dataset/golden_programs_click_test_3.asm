; DESCRIPTION: Display a square using color blue at the screen.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r10, 0
    LDI r8, 0
    LDI r7, 256
    LDI r9, 256
    LDI r6, 0x000033
    RECT r10, r8, r7, r9, r6

main_loop:
    ;; Read mouse position
    MOUSEX r10       ; r10 = mouse X
    MOUSEY r8       ; r8 = mouse Y

    ;; Read button state
    MOUSEB r7       ; r7 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r6, 0xFF0000
    PIXEL r10, r8, r6         ; center pixel
    SUBI r10, 1
    PIXEL r10, r8, r6         ; -1
    SUBI r10, 1
    PIXEL r10, r8, r6         ; -2
    ADDI r10, 3
    PIXEL r10, r8, r6         ; +1
    ADDI r10, 1
    PIXEL r10, r8, r6         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r10, 2               ; restore r10 to center
    PIXEL r10, r8, r6         ; center (already drawn, harmless)
    SUBI r8, 1
    PIXEL r10, r8, r6         ; up 1
    SUBI r8, 1
    PIXEL r10, r8, r6         ; up 2
    ADDI r8, 3
    PIXEL r10, r8, r6         ; down 1
    ADDI r8, 1
    PIXEL r10, r8, r6         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r7, 1
    JZ r7, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r6, 0x00FF00
    PIXEL r10, r8, r6
    SUBI r10, 1
    PIXEL r10, r8, r6
    ADDI r8, 1
    ADDI r10, 1
    PIXEL r10, r8, r6
    ADDI r10, 1
    PIXEL r10, r8, r6

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r11    ; r11=event_type, r3=x, r14=y
    JZ r11, wait_frame

    ;; Click detected: draw a yellow square (0xFFFF00) at click position
    LDI r6, 0xFFFF00
    PIXEL r3, r14, r6
    ADDI r3, 1
    PIXEL r3, r14, r6
    ADDI r14, 1
    PIXEL r3, r14, r6
    SUBI r3, 1
    PIXEL r3, r14, r6

wait_frame:
    ;; Small delay loop
    LDI r12, 100
delay:
    SUBI r12, 1
    JNZ r12, delay

    JMP main_loop
