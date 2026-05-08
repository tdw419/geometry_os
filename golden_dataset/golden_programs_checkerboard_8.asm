; DESCRIPTION: The GeOS assembly code generates an 8x8 checkerboard pattern by iterating over each pixel on a 256x256 grid. It alternates between black and white colors for adjacent squares based on the parity of the sum of the row and column indices divided by 8.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r3, 0            ; r3 = y
LDI r12, 256          ; r12 = limit
LDI r5, 8            ; r5 = cell size
LDI r4, 0x000000    ; r4 = black
LDI r10, 0xFFFFFF    ; r10 = white
LDI r0, 0           ; r0 = cell_row
LDI r8, 0           ; r8 = y-in-cell counter (0..7)

y_loop:
  LDI r1, 0         ; r1 = cell_col (reset each row)
  LDI r15, 0         ; r15 = x-in-cell counter (0..7)
  LDI r2, 0          ; r2 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r14, 0
  ADD r14, r0
  ADD r14, r1        ; r14 = cell_row + cell_col
  LDI r7, 1
  AND r14, r7         ; r14 = parity (0 or 1)

  ; Draw pixel
  JZ r14, draw_white
  LDI r14, 0
  ADD r14, r4
  PSET r2, r3, r14
  JMP advance_x

draw_white:
  LDI r14, 0
  ADD r14, r10
  PSET r2, r3, r14

advance_x:
  ; x++
  LDI r7, 1
  ADD r2, r7
  ; x-in-cell++
  ADD r15, r7

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r14, 0
  ADD r14, r15
  SUB r14, r5
  JNZ r14, check_x_done
  ADD r1, r7         ; cell_col++ (r7=1)
  LDI r15, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r14, 0
  ADD r14, r2
  SUB r14, r12
  JZ r14, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r7, 1
  ADD r3, r7
  ; y-in-cell++
  ADD r8, r7

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r14, 0
  ADD r14, r8
  SUB r14, r5
  JNZ r14, check_y_done
  ADD r0, r7         ; cell_row++ (r7=1)
  LDI r8, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r14, 0
  ADD r14, r3
  SUB r14, r12
  JZ r14, done
  JMP y_loop

done:
HALT
