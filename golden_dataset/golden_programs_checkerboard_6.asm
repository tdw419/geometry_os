; DESCRIPTION: Draws a white square at the screen with fixed size.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r7, 0            ; r7 = y
LDI r1, 256          ; r1 = limit
LDI r4, 8            ; r4 = cell size
LDI r13, 0x000000    ; r13 = black
LDI r11, 0xFFFFFF    ; r11 = white
LDI r14, 0           ; r14 = cell_row
LDI r6, 0           ; r6 = y-in-cell counter (0..7)

y_loop:
  LDI r8, 0         ; r8 = cell_col (reset each row)
  LDI r12, 0         ; r12 = x-in-cell counter (0..7)
  LDI r0, 0          ; r0 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r10, 0
  ADD r10, r14
  ADD r10, r8        ; r10 = cell_row + cell_col
  LDI r15, 1
  AND r10, r15         ; r10 = parity (0 or 1)

  ; Draw pixel
  JZ r10, draw_white
  LDI r10, 0
  ADD r10, r13
  PSET r0, r7, r10
  JMP advance_x

draw_white:
  LDI r10, 0
  ADD r10, r11
  PSET r0, r7, r10

advance_x:
  ; x++
  LDI r15, 1
  ADD r0, r15
  ; x-in-cell++
  ADD r12, r15

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r10, 0
  ADD r10, r12
  SUB r10, r4
  JNZ r10, check_x_done
  ADD r8, r15         ; cell_col++ (r15=1)
  LDI r12, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r10, 0
  ADD r10, r0
  SUB r10, r1
  JZ r10, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r15, 1
  ADD r7, r15
  ; y-in-cell++
  ADD r6, r15

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r10, 0
  ADD r10, r6
  SUB r10, r4
  JNZ r10, check_y_done
  ADD r14, r15         ; cell_row++ (r15=1)
  LDI r6, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r10, 0
  ADD r10, r7
  SUB r10, r1
  JZ r10, done
  JMP y_loop

done:
HALT
