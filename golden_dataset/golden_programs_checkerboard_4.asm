; DESCRIPTION: The GeOS assembly code generates an 8x8 checkerboard pattern by iterating over each pixel on a 256x256 grid. It alternates between black and white colors for adjacent squares based on the parity of the sum of the row and column indices divided by 8.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r9, 0            ; r9 = y
LDI r1, 256          ; r1 = limit
LDI r0, 8            ; r0 = cell size
LDI r13, 0x000000    ; r13 = black
LDI r6, 0xFFFFFF    ; r6 = white
LDI r8, 0           ; r8 = cell_row
LDI r7, 0           ; r7 = y-in-cell counter (0..7)

y_loop:
  LDI r2, 0         ; r2 = cell_col (reset each row)
  LDI r10, 0         ; r10 = x-in-cell counter (0..7)
  LDI r11, 0          ; r11 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r14, 0
  ADD r14, r8
  ADD r14, r2        ; r14 = cell_row + cell_col
  LDI r5, 1
  AND r14, r5         ; r14 = parity (0 or 1)

  ; Draw pixel
  JZ r14, draw_white
  LDI r14, 0
  ADD r14, r13
  PSET r11, r9, r14
  JMP advance_x

draw_white:
  LDI r14, 0
  ADD r14, r6
  PSET r11, r9, r14

advance_x:
  ; x++
  LDI r5, 1
  ADD r11, r5
  ; x-in-cell++
  ADD r10, r5

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r14, 0
  ADD r14, r10
  SUB r14, r0
  JNZ r14, check_x_done
  ADD r2, r5         ; cell_col++ (r5=1)
  LDI r10, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r14, 0
  ADD r14, r11
  SUB r14, r1
  JZ r14, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r5, 1
  ADD r9, r5
  ; y-in-cell++
  ADD r7, r5

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r14, 0
  ADD r14, r7
  SUB r14, r0
  JNZ r14, check_y_done
  ADD r8, r5         ; cell_row++ (r5=1)
  LDI r7, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r14, 0
  ADD r14, r9
  SUB r14, r1
  JZ r14, done
  JMP y_loop

done:
HALT
