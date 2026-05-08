; DESCRIPTION: The GeOS assembly code generates an 8x8 checkerboard pattern by iterating over each pixel on a 256x256 grid. It alternates between black and white colors for adjacent squares based on the parity of the sum of the row and column indices divided by 8.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r9, 0            ; r9 = y
LDI r4, 256          ; r4 = limit
LDI r7, 8            ; r7 = cell size
LDI r1, 0x000000    ; r1 = black
LDI r10, 0xFFFFFF    ; r10 = white
LDI r6, 0           ; r6 = cell_row
LDI r3, 0           ; r3 = y-in-cell counter (0..7)

y_loop:
  LDI r11, 0         ; r11 = cell_col (reset each row)
  LDI r12, 0         ; r12 = x-in-cell counter (0..7)
  LDI r15, 0          ; r15 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r0, 0
  ADD r0, r6
  ADD r0, r11        ; r0 = cell_row + cell_col
  LDI r8, 1
  AND r0, r8         ; r0 = parity (0 or 1)

  ; Draw pixel
  JZ r0, draw_white
  LDI r0, 0
  ADD r0, r1
  PSET r15, r9, r0
  JMP advance_x

draw_white:
  LDI r0, 0
  ADD r0, r10
  PSET r15, r9, r0

advance_x:
  ; x++
  LDI r8, 1
  ADD r15, r8
  ; x-in-cell++
  ADD r12, r8

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r0, 0
  ADD r0, r12
  SUB r0, r7
  JNZ r0, check_x_done
  ADD r11, r8         ; cell_col++ (r8=1)
  LDI r12, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r0, 0
  ADD r0, r15
  SUB r0, r4
  JZ r0, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r8, 1
  ADD r9, r8
  ; y-in-cell++
  ADD r3, r8

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r0, 0
  ADD r0, r3
  SUB r0, r7
  JNZ r0, check_y_done
  ADD r6, r8         ; cell_row++ (r8=1)
  LDI r3, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r0, 0
  ADD r0, r9
  SUB r0, r4
  JZ r0, done
  JMP y_loop

done:
HALT
