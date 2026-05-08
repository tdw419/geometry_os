; DESCRIPTION: Draw square: pos=the screen, color=white, size=fixed size.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r1, 0            ; r1 = y
LDI r2, 256          ; r2 = limit
LDI r8, 8            ; r8 = cell size
LDI r6, 0x000000    ; r6 = black
LDI r12, 0xFFFFFF    ; r12 = white
LDI r5, 0           ; r5 = cell_row
LDI r14, 0           ; r14 = y-in-cell counter (0..7)

y_loop:
  LDI r9, 0         ; r9 = cell_col (reset each row)
  LDI r10, 0         ; r10 = x-in-cell counter (0..7)
  LDI r13, 0          ; r13 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r0, 0
  ADD r0, r5
  ADD r0, r9        ; r0 = cell_row + cell_col
  LDI r11, 1
  AND r0, r11         ; r0 = parity (0 or 1)

  ; Draw pixel
  JZ r0, draw_white
  LDI r0, 0
  ADD r0, r6
  PSET r13, r1, r0
  JMP advance_x

draw_white:
  LDI r0, 0
  ADD r0, r12
  PSET r13, r1, r0

advance_x:
  ; x++
  LDI r11, 1
  ADD r13, r11
  ; x-in-cell++
  ADD r10, r11

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r0, 0
  ADD r0, r10
  SUB r0, r8
  JNZ r0, check_x_done
  ADD r9, r11         ; cell_col++ (r11=1)
  LDI r10, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r0, 0
  ADD r0, r13
  SUB r0, r2
  JZ r0, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r11, 1
  ADD r1, r11
  ; y-in-cell++
  ADD r14, r11

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r0, 0
  ADD r0, r14
  SUB r0, r8
  JNZ r0, check_y_done
  ADD r5, r11         ; cell_row++ (r11=1)
  LDI r14, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r0, 0
  ADD r0, r1
  SUB r0, r2
  JZ r0, done
  JMP y_loop

done:
HALT
