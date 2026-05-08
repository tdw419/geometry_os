; DESCRIPTION: A white square centered at the screen with fixed size.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r10, 0            ; r10 = y
LDI r4, 256          ; r4 = limit
LDI r11, 8            ; r11 = cell size
LDI r6, 0x000000    ; r6 = black
LDI r5, 0xFFFFFF    ; r5 = white
LDI r9, 0           ; r9 = cell_row
LDI r15, 0           ; r15 = y-in-cell counter (0..7)

y_loop:
  LDI r1, 0         ; r1 = cell_col (reset each row)
  LDI r0, 0         ; r0 = x-in-cell counter (0..7)
  LDI r14, 0          ; r14 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r2, 0
  ADD r2, r9
  ADD r2, r1        ; r2 = cell_row + cell_col
  LDI r12, 1
  AND r2, r12         ; r2 = parity (0 or 1)

  ; Draw pixel
  JZ r2, draw_white
  LDI r2, 0
  ADD r2, r6
  PSET r14, r10, r2
  JMP advance_x

draw_white:
  LDI r2, 0
  ADD r2, r5
  PSET r14, r10, r2

advance_x:
  ; x++
  LDI r12, 1
  ADD r14, r12
  ; x-in-cell++
  ADD r0, r12

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r2, 0
  ADD r2, r0
  SUB r2, r11
  JNZ r2, check_x_done
  ADD r1, r12         ; cell_col++ (r12=1)
  LDI r0, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r2, 0
  ADD r2, r14
  SUB r2, r4
  JZ r2, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r12, 1
  ADD r10, r12
  ; y-in-cell++
  ADD r15, r12

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r2, 0
  ADD r2, r15
  SUB r2, r11
  JNZ r2, check_y_done
  ADD r9, r12         ; cell_row++ (r12=1)
  LDI r15, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r2, 0
  ADD r2, r10
  SUB r2, r4
  JZ r2, done
  JMP y_loop

done:
HALT
