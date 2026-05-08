; DESCRIPTION: Geometry OS program to draw a white square.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r12, 0            ; r12 = y
LDI r8, 256          ; r8 = limit
LDI r3, 8            ; r3 = cell size
LDI r14, 0x000000    ; r14 = black
LDI r11, 0xFFFFFF    ; r11 = white
LDI r15, 0           ; r15 = cell_row
LDI r9, 0           ; r9 = y-in-cell counter (0..7)

y_loop:
  LDI r13, 0         ; r13 = cell_col (reset each row)
  LDI r10, 0         ; r10 = x-in-cell counter (0..7)
  LDI r7, 0          ; r7 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r1, 0
  ADD r1, r15
  ADD r1, r13        ; r1 = cell_row + cell_col
  LDI r6, 1
  AND r1, r6         ; r1 = parity (0 or 1)

  ; Draw pixel
  JZ r1, draw_white
  LDI r1, 0
  ADD r1, r14
  PSET r7, r12, r1
  JMP advance_x

draw_white:
  LDI r1, 0
  ADD r1, r11
  PSET r7, r12, r1

advance_x:
  ; x++
  LDI r6, 1
  ADD r7, r6
  ; x-in-cell++
  ADD r10, r6

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r1, 0
  ADD r1, r10
  SUB r1, r3
  JNZ r1, check_x_done
  ADD r13, r6         ; cell_col++ (r6=1)
  LDI r10, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r1, 0
  ADD r1, r7
  SUB r1, r8
  JZ r1, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r6, 1
  ADD r12, r6
  ; y-in-cell++
  ADD r9, r6

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r1, 0
  ADD r1, r9
  SUB r1, r3
  JNZ r1, check_y_done
  ADD r15, r6         ; cell_row++ (r6=1)
  LDI r9, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r1, 0
  ADD r1, r12
  SUB r1, r8
  JZ r1, done
  JMP y_loop

done:
HALT
