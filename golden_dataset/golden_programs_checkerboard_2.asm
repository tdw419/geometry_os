; DESCRIPTION: Draws a white square at the screen with fixed size.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r7, 0            ; r7 = y
LDI r13, 256          ; r13 = limit
LDI r3, 8            ; r3 = cell size
LDI r5, 0x000000    ; r5 = black
LDI r4, 0xFFFFFF    ; r4 = white
LDI r1, 0           ; r1 = cell_row
LDI r0, 0           ; r0 = y-in-cell counter (0..7)

y_loop:
  LDI r2, 0         ; r2 = cell_col (reset each row)
  LDI r6, 0         ; r6 = x-in-cell counter (0..7)
  LDI r10, 0          ; r10 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r12, 0
  ADD r12, r1
  ADD r12, r2        ; r12 = cell_row + cell_col
  LDI r9, 1
  AND r12, r9         ; r12 = parity (0 or 1)

  ; Draw pixel
  JZ r12, draw_white
  LDI r12, 0
  ADD r12, r5
  PSET r10, r7, r12
  JMP advance_x

draw_white:
  LDI r12, 0
  ADD r12, r4
  PSET r10, r7, r12

advance_x:
  ; x++
  LDI r9, 1
  ADD r10, r9
  ; x-in-cell++
  ADD r6, r9

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r12, 0
  ADD r12, r6
  SUB r12, r3
  JNZ r12, check_x_done
  ADD r2, r9         ; cell_col++ (r9=1)
  LDI r6, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r12, 0
  ADD r12, r10
  SUB r12, r13
  JZ r12, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r9, 1
  ADD r7, r9
  ; y-in-cell++
  ADD r0, r9

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r12, 0
  ADD r12, r0
  SUB r12, r3
  JNZ r12, check_y_done
  ADD r1, r9         ; cell_row++ (r9=1)
  LDI r0, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r12, 0
  ADD r12, r7
  SUB r12, r13
  JZ r12, done
  JMP y_loop

done:
HALT
