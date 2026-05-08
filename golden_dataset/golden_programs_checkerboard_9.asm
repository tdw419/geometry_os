; DESCRIPTION: The GeOS assembly code generates an 8x8 checkerboard pattern by iterating over each pixel on a 256x256 grid. It alternates between black and white colors for adjacent squares based on the parity of the sum of the row and column indices divided by 8.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r1, 0            ; r1 = y
LDI r5, 256          ; r5 = limit
LDI r13, 8            ; r13 = cell size
LDI r10, 0x000000    ; r10 = black
LDI r12, 0xFFFFFF    ; r12 = white
LDI r6, 0           ; r6 = cell_row
LDI r2, 0           ; r2 = y-in-cell counter (0..7)

y_loop:
  LDI r11, 0         ; r11 = cell_col (reset each row)
  LDI r15, 0         ; r15 = x-in-cell counter (0..7)
  LDI r8, 0          ; r8 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r7, 0
  ADD r7, r6
  ADD r7, r11        ; r7 = cell_row + cell_col
  LDI r3, 1
  AND r7, r3         ; r7 = parity (0 or 1)

  ; Draw pixel
  JZ r7, draw_white
  LDI r7, 0
  ADD r7, r10
  PSET r8, r1, r7
  JMP advance_x

draw_white:
  LDI r7, 0
  ADD r7, r12
  PSET r8, r1, r7

advance_x:
  ; x++
  LDI r3, 1
  ADD r8, r3
  ; x-in-cell++
  ADD r15, r3

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r7, 0
  ADD r7, r15
  SUB r7, r13
  JNZ r7, check_x_done
  ADD r11, r3         ; cell_col++ (r3=1)
  LDI r15, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r7, 0
  ADD r7, r8
  SUB r7, r5
  JZ r7, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r3, 1
  ADD r1, r3
  ; y-in-cell++
  ADD r2, r3

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r7, 0
  ADD r7, r2
  SUB r7, r13
  JNZ r7, check_y_done
  ADD r6, r3         ; cell_row++ (r3=1)
  LDI r2, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r7, 0
  ADD r7, r1
  SUB r7, r5
  JZ r7, done
  JMP y_loop

done:
HALT
