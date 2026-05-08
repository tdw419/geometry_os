; DESCRIPTION: Render a blue square at the screen.

;; click_test.asm -- Phase 217 Mouse Support Demo
;; Draws a crosshair at the cursor and paints pixels on click.
;; Demonstrates MOUSEX, MOUSEY, MOUSEB, MOUSECLICK opcodes.

.section code

start:
    ;; Fill background dark blue (0x000033)
    LDI r13, 0
    LDI r9, 0
    LDI r14, 256
    LDI r2, 256
    LDI r15, 0x000033
    RECT r13, r9, r14, r2, r15

main_loop:
    ;; Read mouse position
    MOUSEX r13       ; r13 = mouse X
    MOUSEY r9       ; r9 = mouse Y

    ;; Read button state
    MOUSEB r14       ; r14 = button bitmask

    ;; Draw crosshair at cursor (red, 0xFF0000)
    ;; Horizontal line: 9 pixels centered on cursor
    LDI r15, 0xFF0000
    PIXEL r13, r9, r15         ; center pixel
    SUBI r13, 1
    PIXEL r13, r9, r15         ; -1
    SUBI r13, 1
    PIXEL r13, r9, r15         ; -2
    ADDI r13, 3
    PIXEL r13, r9, r15         ; +1
    ADDI r13, 1
    PIXEL r13, r9, r15         ; +2

    ;; Vertical line: 5 pixels centered on cursor
    SUBI r13, 2               ; restore r13 to center
    PIXEL r13, r9, r15         ; center (already drawn, harmless)
    SUBI r9, 1
    PIXEL r13, r9, r15         ; up 1
    SUBI r9, 1
    PIXEL r13, r9, r15         ; up 2
    ADDI r9, 3
    PIXEL r13, r9, r15         ; down 1
    ADDI r9, 1
    PIXEL r13, r9, r15         ; down 2

    ;; Check if left button is held (bit 0)
    ANDI r14, 1
    JZ r14, check_click

    ;; Paint a green dot while dragging (0x00FF00)
    LDI r15, 0x00FF00
    PIXEL r13, r9, r15
    SUBI r13, 1
    PIXEL r13, r9, r15
    ADDI r9, 1
    ADDI r13, 1
    PIXEL r13, r9, r15
    ADDI r13, 1
    PIXEL r13, r9, r15

check_click:
    ;; Check for click event (non-blocking peek)
    MOUSECLICK r1    ; r1=event_type, r12=x, r7=y
    JZ r1, wait_frame

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
    LDI r0, 100
delay:
    SUBI r0, 1
    JNZ r0, delay

    JMP main_loop
