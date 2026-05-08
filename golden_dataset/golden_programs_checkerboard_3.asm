; DESCRIPTION: Draws a white square at the screen with fixed size.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r1, 0            ; r1 = y
LDI r5, 256          ; r5 = limit
LDI r10, 8            ; r10 = cell size
LDI r9, 0x000000    ; r9 = black
LDI r3, 0xFFFFFF    ; r3 = white
LDI r2, 0           ; r2 = cell_row
LDI r6, 0           ; r6 = y-in-cell counter (0..7)

y_loop:
  LDI r7, 0         ; r7 = cell_col (reset each row)
  LDI r8, 0         ; r8 = x-in-cell counter (0..7)
  LDI r13, 0          ; r13 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r14, 0
  ADD r14, r2
  ADD r14, r7        ; r14 = cell_row + cell_col
  LDI r11, 1
  AND r14, r11         ; r14 = parity (0 or 1)

  ; Draw pixel
  JZ r14, draw_white
  LDI r14, 0
  ADD r14, r9
  PSET r13, r1, r14
  JMP advance_x

draw_white:
  LDI r14, 0
  ADD r14, r3
  PSET r13, r1, r14

advance_x:
  ; x++
  LDI r11, 1
  ADD r13, r11
  ; x-in-cell++
  ADD r8, r11

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r14, 0
  ADD r14, r8
  SUB r14, r10
  JNZ r14, check_x_done
  ADD r7, r11         ; cell_col++ (r11=1)
  LDI r8, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r14, 0
  ADD r14, r13
  SUB r14, r5
  JZ r14, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r11, 1
  ADD r1, r11
  ; y-in-cell++
  ADD r6, r11

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r14, 0
  ADD r14, r6
  SUB r14, r10
  JNZ r14, check_y_done
  ADD r2, r11         ; cell_row++ (r11=1)
  LDI r6, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r14, 0
  ADD r14, r1
  SUB r14, r5
  JZ r14, done
  JMP y_loop

done:
HALT
