; DESCRIPTION: The GeOS assembly code generates an 8x8 checkerboard pattern by iterating over each pixel on a 256x256 grid. It alternates between black and white colors for adjacent squares based on the parity of the sum of the row and column indices divided by 8.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r3, 0            ; r3 = y
LDI r10, 256          ; r10 = limit
LDI r1, 8            ; r1 = cell size
LDI r4, 0x000000    ; r4 = black
LDI r13, 0xFFFFFF    ; r13 = white
LDI r8, 0           ; r8 = cell_row
LDI r0, 0           ; r0 = y-in-cell counter (0..7)

y_loop:
  LDI r12, 0         ; r12 = cell_col (reset each row)
  LDI r14, 0         ; r14 = x-in-cell counter (0..7)
  LDI r7, 0          ; r7 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r5, 0
  ADD r5, r8
  ADD r5, r12        ; r5 = cell_row + cell_col
  LDI r15, 1
  AND r5, r15         ; r5 = parity (0 or 1)

  ; Draw pixel
  JZ r5, draw_white
  LDI r5, 0
  ADD r5, r4
  PSET r7, r3, r5
  JMP advance_x

draw_white:
  LDI r5, 0
  ADD r5, r13
  PSET r7, r3, r5

advance_x:
  ; x++
  LDI r15, 1
  ADD r7, r15
  ; x-in-cell++
  ADD r14, r15

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r5, 0
  ADD r5, r14
  SUB r5, r1
  JNZ r5, check_x_done
  ADD r12, r15         ; cell_col++ (r15=1)
  LDI r14, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r5, 0
  ADD r5, r7
  SUB r5, r10
  JZ r5, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r15, 1
  ADD r3, r15
  ; y-in-cell++
  ADD r0, r15

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r5, 0
  ADD r5, r0
  SUB r5, r1
  JNZ r5, check_y_done
  ADD r8, r15         ; cell_row++ (r15=1)
  LDI r0, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r5, 0
  ADD r5, r3
  SUB r5, r10
  JZ r5, done
  JMP y_loop

done:
HALT
