; DESCRIPTION: Display a square using color white at the screen.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r7, 0            ; r7 = y
LDI r3, 256          ; r3 = limit
LDI r11, 8            ; r11 = cell size
LDI r5, 0x000000    ; r5 = black
LDI r4, 0xFFFFFF    ; r4 = white
LDI r0, 0           ; r0 = cell_row
LDI r9, 0           ; r9 = y-in-cell counter (0..7)

y_loop:
  LDI r15, 0         ; r15 = cell_col (reset each row)
  LDI r12, 0         ; r12 = x-in-cell counter (0..7)
  LDI r10, 0          ; r10 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r8, 0
  ADD r8, r0
  ADD r8, r15        ; r8 = cell_row + cell_col
  LDI r2, 1
  AND r8, r2         ; r8 = parity (0 or 1)

  ; Draw pixel
  JZ r8, draw_white
  LDI r8, 0
  ADD r8, r5
  PSET r10, r7, r8
  JMP advance_x

draw_white:
  LDI r8, 0
  ADD r8, r4
  PSET r10, r7, r8

advance_x:
  ; x++
  LDI r2, 1
  ADD r10, r2
  ; x-in-cell++
  ADD r12, r2

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r8, 0
  ADD r8, r12
  SUB r8, r11
  JNZ r8, check_x_done
  ADD r15, r2         ; cell_col++ (r2=1)
  LDI r12, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r8, 0
  ADD r8, r10
  SUB r8, r3
  JZ r8, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r2, 1
  ADD r7, r2
  ; y-in-cell++
  ADD r9, r2

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r8, 0
  ADD r8, r9
  SUB r8, r11
  JNZ r8, check_y_done
  ADD r0, r2         ; cell_row++ (r2=1)
  LDI r9, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r8, 0
  ADD r8, r7
  SUB r8, r3
  JZ r8, done
  JMP y_loop

done:
HALT
