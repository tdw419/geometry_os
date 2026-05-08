; DESCRIPTION: The GeOS assembly code generates an 8x8 checkerboard pattern by iterating over each pixel on a 256x256 grid. It alternates between black and white colors for adjacent squares based on the parity of the sum of the row and column indices divided by 8.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r4, 0            ; r4 = y
LDI r6, 256          ; r6 = limit
LDI r5, 8            ; r5 = cell size
LDI r15, 0x000000    ; r15 = black
LDI r13, 0xFFFFFF    ; r13 = white
LDI r12, 0           ; r12 = cell_row
LDI r1, 0           ; r1 = y-in-cell counter (0..7)

y_loop:
  LDI r3, 0         ; r3 = cell_col (reset each row)
  LDI r10, 0         ; r10 = x-in-cell counter (0..7)
  LDI r7, 0          ; r7 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r0, 0
  ADD r0, r12
  ADD r0, r3        ; r0 = cell_row + cell_col
  LDI r14, 1
  AND r0, r14         ; r0 = parity (0 or 1)

  ; Draw pixel
  JZ r0, draw_white
  LDI r0, 0
  ADD r0, r15
  PSET r7, r4, r0
  JMP advance_x

draw_white:
  LDI r0, 0
  ADD r0, r13
  PSET r7, r4, r0

advance_x:
  ; x++
  LDI r14, 1
  ADD r7, r14
  ; x-in-cell++
  ADD r10, r14

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r0, 0
  ADD r0, r10
  SUB r0, r5
  JNZ r0, check_x_done
  ADD r3, r14         ; cell_col++ (r14=1)
  LDI r10, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r0, 0
  ADD r0, r7
  SUB r0, r6
  JZ r0, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r14, 1
  ADD r4, r14
  ; y-in-cell++
  ADD r1, r14

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r0, 0
  ADD r0, r1
  SUB r0, r5
  JNZ r0, check_y_done
  ADD r12, r14         ; cell_row++ (r14=1)
  LDI r1, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r0, 0
  ADD r0, r4
  SUB r0, r6
  JZ r0, done
  JMP y_loop

done:
HALT
