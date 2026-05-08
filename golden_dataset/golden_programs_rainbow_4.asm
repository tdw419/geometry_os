; DESCRIPTION: Geometry OS program to draw a red object.

; RAINBOW -- Diagonal pattern
LDI r11, 0      ; x
LDI r8, 0      ; y
LDI r2, 256    ; limit
LDI r1, 0      ; color (temp)
LDI r15, 1      ; increment
LDI r10, 6      ; color count

loop_y:
  LDI r11, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r13, 0
  ADD r13, r11   ; temp = x
  ADD r13, r8   ; temp = x + y
  MOD r13, r10   ; temp = (x + y) % 6
  
  ; select color from index in r13
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r0, 0
  CMP r13, r0
  JZ r7, set_red
  
  LDI r0, 1
  CMP r13, r0
  JZ r7, set_orange
  
  LDI r0, 2
  CMP r13, r0
  JZ r7, set_yellow
  
  LDI r0, 3
  CMP r13, r0
  JZ r7, set_green
  
  LDI r0, 4
  CMP r13, r0
  JZ r7, set_blue
  
  ; else purple
  LDI r1, 0x800080
  JMP draw

set_red:
  LDI r1, 0xFF0000
  JMP draw
set_orange:
  LDI r1, 0xFFA500
  JMP draw
set_yellow:
  LDI r1, 0xFFFF00
  JMP draw
set_green:
  LDI r1, 0x00FF00
  JMP draw
set_blue:
  LDI r1, 0x0000FF

draw:
  PSET r11, r8, r1
  ADD r11, r15   ; x++
  CMP r11, r2
  JZ r7, next_y
  JMP loop_x

next_y:
  ADD r8, r15   ; y++
  CMP r8, r2
  JZ r7, done
  JMP loop_y

done:
  HALT
