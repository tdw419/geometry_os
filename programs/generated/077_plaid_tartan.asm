; PLAID PATTERN -- Tartan-style woven color bands using PSET
; 16x16 pixel cells with 4-color pattern based on cell parity
; Colors: red, green, blue, yellow in a checkerboard layout

LDI r0, 0            ; r0 = y
LDI r2, 256          ; r2 = screen limit
LDI r3, 16           ; r3 = cell size
LDI r10, 0xFF0000    ; r10 = red
LDI r11, 0x00FF00    ; r11 = green
LDI r12, 0x0000FF    ; r12 = blue
LDI r13, 0xFFFF00    ; r13 = yellow
LDI r14, 0           ; r14 = cell_y index
LDI r15, 0           ; r15 = y-in-cell counter (0..15)

y_loop:
  LDI r16, 0         ; r16 = cell_x index (reset each row)
  LDI r17, 0         ; r17 = x-in-cell counter (0..15)
  LDI r1, 0          ; r1 = x

x_loop:
  ; Determine color from (cell_x & 1, cell_y & 1)
  LDI r6, 0
  ADD r6, r16
  LDI r7, 1
  AND r6, r7         ; r6 = cell_x & 1
  JNZ r6, cx_odd

  ; cell_x even: check cell_y parity
  LDI r6, 0
  ADD r6, r14
  AND r6, r7
  JNZ r6, even_odd
  ; Both even -> red
  LDI r6, 0
  ADD r6, r10
  PSET r1, r0, r6
  JMP adv_x

even_odd:
  ; cell_x even, cell_y odd -> blue
  LDI r6, 0
  ADD r6, r12
  PSET r1, r0, r6
  JMP adv_x

cx_odd:
  ; cell_x odd: check cell_y parity
  LDI r6, 0
  ADD r6, r14
  AND r6, r7
  JNZ r6, odd_odd
  ; cell_x odd, cell_y even -> green
  LDI r6, 0
  ADD r6, r11
  PSET r1, r0, r6
  JMP adv_x

odd_odd:
  ; Both odd -> yellow
  LDI r6, 0
  ADD r6, r13
  PSET r1, r0, r6

adv_x:
  LDI r7, 1
  ADD r1, r7
  ADD r17, r7
  ; If x-in-cell == 16, advance cell_x
  LDI r6, 0
  ADD r6, r17
  SUB r6, r3
  JNZ r6, chk_x
  ADD r16, r7
  LDI r17, 0

chk_x:
  LDI r6, 0
  ADD r6, r1
  SUB r6, r2
  JZ r6, adv_y
  JMP x_loop

adv_y:
  LDI r7, 1
  ADD r0, r7
  ADD r15, r7
  ; If y-in-cell == 16, advance cell_y
  LDI r6, 0
  ADD r6, r15
  SUB r6, r3
  JNZ r6, chk_y
  ADD r14, r7
  LDI r15, 0

chk_y:
  LDI r6, 0
  ADD r6, r0
  SUB r6, r2
  JZ r6, done
  JMP y_loop

done:
HALT
