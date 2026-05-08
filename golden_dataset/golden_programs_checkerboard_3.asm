; DESCRIPTION: The GeOS assembly code generates an 8x8 checkerboard pattern by iterating over each pixel on a 256x256 grid. It alternates between black and white colors for adjacent squares based on the parity of the sum of the row and column indices divided by 8.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r10, 0            ; r10 = y
LDI r1, 256          ; r1 = limit
LDI r13, 8            ; r13 = cell size
LDI r14, 0x000000    ; r14 = black
LDI r5, 0xFFFFFF    ; r5 = white
LDI r4, 0           ; r4 = cell_row
LDI r0, 0           ; r0 = y-in-cell counter (0..7)

y_loop:
  LDI r15, 0         ; r15 = cell_col (reset each row)
  LDI r3, 0         ; r3 = x-in-cell counter (0..7)
  LDI r12, 0          ; r12 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r9, 0
  ADD r9, r4
  ADD r9, r15        ; r9 = cell_row + cell_col
  LDI r11, 1
  AND r9, r11         ; r9 = parity (0 or 1)

  ; Draw pixel
  JZ r9, draw_white
  LDI r9, 0
  ADD r9, r14
  PSET r12, r10, r9
  JMP advance_x

draw_white:
  LDI r9, 0
  ADD r9, r5
  PSET r12, r10, r9

advance_x:
  ; x++
  LDI r11, 1
  ADD r12, r11
  ; x-in-cell++
  ADD r3, r11

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r9, 0
  ADD r9, r3
  SUB r9, r13
  JNZ r9, check_x_done
  ADD r15, r11         ; cell_col++ (r11=1)
  LDI r3, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r9, 0
  ADD r9, r12
  SUB r9, r1
  JZ r9, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r11, 1
  ADD r10, r11
  ; y-in-cell++
  ADD r0, r11

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r9, 0
  ADD r9, r0
  SUB r9, r13
  JNZ r9, check_y_done
  ADD r4, r11         ; cell_row++ (r11=1)
  LDI r0, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r9, 0
  ADD r9, r10
  SUB r9, r1
  JZ r9, done
  JMP y_loop

done:
HALT
