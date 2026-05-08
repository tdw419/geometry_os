; DESCRIPTION: Draw square: pos=the screen, color=white, size=fixed size.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r13, 0            ; r13 = y
LDI r2, 256          ; r2 = limit
LDI r8, 8            ; r8 = cell size
LDI r10, 0x000000    ; r10 = black
LDI r4, 0xFFFFFF    ; r4 = white
LDI r6, 0           ; r6 = cell_row
LDI r7, 0           ; r7 = y-in-cell counter (0..7)

y_loop:
  LDI r0, 0         ; r0 = cell_col (reset each row)
  LDI r3, 0         ; r3 = x-in-cell counter (0..7)
  LDI r14, 0          ; r14 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r1, 0
  ADD r1, r6
  ADD r1, r0        ; r1 = cell_row + cell_col
  LDI r5, 1
  AND r1, r5         ; r1 = parity (0 or 1)

  ; Draw pixel
  JZ r1, draw_white
  LDI r1, 0
  ADD r1, r10
  PSET r14, r13, r1
  JMP advance_x

draw_white:
  LDI r1, 0
  ADD r1, r4
  PSET r14, r13, r1

advance_x:
  ; x++
  LDI r5, 1
  ADD r14, r5
  ; x-in-cell++
  ADD r3, r5

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r1, 0
  ADD r1, r3
  SUB r1, r8
  JNZ r1, check_x_done
  ADD r0, r5         ; cell_col++ (r5=1)
  LDI r3, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r1, 0
  ADD r1, r14
  SUB r1, r2
  JZ r1, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r5, 1
  ADD r13, r5
  ; y-in-cell++
  ADD r7, r5

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r1, 0
  ADD r1, r7
  SUB r1, r8
  JNZ r1, check_y_done
  ADD r6, r5         ; cell_row++ (r5=1)
  LDI r7, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r1, 0
  ADD r1, r13
  SUB r1, r2
  JZ r1, done
  JMP y_loop

done:
HALT
