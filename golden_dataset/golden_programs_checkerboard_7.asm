; DESCRIPTION: The GeOS assembly code generates an 8x8 checkerboard pattern by iterating over each pixel on a 256x256 grid. It alternates between black and white colors for adjacent squares based on the parity of the sum of the row and column indices divided by 8.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r12, 0            ; r12 = y
LDI r1, 256          ; r1 = limit
LDI r2, 8            ; r2 = cell size
LDI r9, 0x000000    ; r9 = black
LDI r13, 0xFFFFFF    ; r13 = white
LDI r15, 0           ; r15 = cell_row
LDI r10, 0           ; r10 = y-in-cell counter (0..7)

y_loop:
  LDI r0, 0         ; r0 = cell_col (reset each row)
  LDI r3, 0         ; r3 = x-in-cell counter (0..7)
  LDI r4, 0          ; r4 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r7, 0
  ADD r7, r15
  ADD r7, r0        ; r7 = cell_row + cell_col
  LDI r5, 1
  AND r7, r5         ; r7 = parity (0 or 1)

  ; Draw pixel
  JZ r7, draw_white
  LDI r7, 0
  ADD r7, r9
  PSET r4, r12, r7
  JMP advance_x

draw_white:
  LDI r7, 0
  ADD r7, r13
  PSET r4, r12, r7

advance_x:
  ; x++
  LDI r5, 1
  ADD r4, r5
  ; x-in-cell++
  ADD r3, r5

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r7, 0
  ADD r7, r3
  SUB r7, r2
  JNZ r7, check_x_done
  ADD r0, r5         ; cell_col++ (r5=1)
  LDI r3, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r7, 0
  ADD r7, r4
  SUB r7, r1
  JZ r7, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r5, 1
  ADD r12, r5
  ; y-in-cell++
  ADD r10, r5

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r7, 0
  ADD r7, r10
  SUB r7, r2
  JNZ r7, check_y_done
  ADD r15, r5         ; cell_row++ (r5=1)
  LDI r10, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r7, 0
  ADD r7, r12
  SUB r7, r1
  JZ r7, done
  JMP y_loop

done:
HALT
