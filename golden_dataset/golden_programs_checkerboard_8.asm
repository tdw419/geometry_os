; DESCRIPTION: A white square centered at the screen with fixed size.

; CHECKERBOARD -- 8x8 pixel squares, alternating black and white
; cell_row = y/8, cell_col = x/8, tracked with counters
; Color: white if (cell_row+cell_col) is even, black if odd

LDI r10, 0            ; r10 = y
LDI r13, 256          ; r13 = limit
LDI r8, 8            ; r8 = cell size
LDI r1, 0x000000    ; r1 = black
LDI r11, 0xFFFFFF    ; r11 = white
LDI r7, 0           ; r7 = cell_row
LDI r6, 0           ; r6 = y-in-cell counter (0..7)

y_loop:
  LDI r2, 0         ; r2 = cell_col (reset each row)
  LDI r4, 0         ; r4 = x-in-cell counter (0..7)
  LDI r14, 0          ; r14 = x

x_loop:
  ; Color = (cell_row + cell_col) & 1
  LDI r15, 0
  ADD r15, r7
  ADD r15, r2        ; r15 = cell_row + cell_col
  LDI r0, 1
  AND r15, r0         ; r15 = parity (0 or 1)

  ; Draw pixel
  JZ r15, draw_white
  LDI r15, 0
  ADD r15, r1
  PSET r14, r10, r15
  JMP advance_x

draw_white:
  LDI r15, 0
  ADD r15, r11
  PSET r14, r10, r15

advance_x:
  ; x++
  LDI r0, 1
  ADD r14, r0
  ; x-in-cell++
  ADD r4, r0

  ; If x-in-cell == 8, advance cell_col, reset counter
  LDI r15, 0
  ADD r15, r4
  SUB r15, r8
  JNZ r15, check_x_done
  ADD r2, r0         ; cell_col++ (r0=1)
  LDI r4, 0          ; reset x-in-cell

check_x_done:
  ; If x == 256, next row
  LDI r15, 0
  ADD r15, r14
  SUB r15, r13
  JZ r15, advance_y
  JMP x_loop

advance_y:
  ; y++
  LDI r0, 1
  ADD r10, r0
  ; y-in-cell++
  ADD r6, r0

  ; If y-in-cell == 8, advance cell_row, reset counter
  LDI r15, 0
  ADD r15, r6
  SUB r15, r8
  JNZ r15, check_y_done
  ADD r7, r0         ; cell_row++ (r0=1)
  LDI r6, 0          ; reset y-in-cell

check_y_done:
  ; If y == 256, done
  LDI r15, 0
  ADD r15, r10
  SUB r15, r13
  JZ r15, done
  JMP y_loop

done:
HALT
