; DESCRIPTION: Draws a red object at the screen with fixed size.

; RAINBOW -- Diagonal pattern
LDI r12, 0      ; x
LDI r8, 0      ; y
LDI r15, 256    ; limit
LDI r4, 0      ; color (temp)
LDI r2, 1      ; increment
LDI r11, 6      ; color count

loop_y:
  LDI r12, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r6, 0
  ADD r6, r12   ; temp = x
  ADD r6, r8   ; temp = x + y
  MOD r6, r11   ; temp = (x + y) % 6
  
  ; select color from index in r6
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r1, 0
  CMP r6, r1
  JZ r0, set_red
  
  LDI r1, 1
  CMP r6, r1
  JZ r0, set_orange
  
  LDI r1, 2
  CMP r6, r1
  JZ r0, set_yellow
  
  LDI r1, 3
  CMP r6, r1
  JZ r0, set_green
  
  LDI r1, 4
  CMP r6, r1
  JZ r0, set_blue
  
  ; else purple
  LDI r4, 0x800080
  JMP draw

set_red:
  LDI r4, 0xFF0000
  JMP draw
set_orange:
  LDI r4, 0xFFA500
  JMP draw
set_yellow:
  LDI r4, 0xFFFF00
  JMP draw
set_green:
  LDI r4, 0x00FF00
  JMP draw
set_blue:
  LDI r4, 0x0000FF

draw:
  PSET r12, r8, r4
  ADD r12, r2   ; x++
  CMP r12, r15
  JZ r0, next_y
  JMP loop_x

next_y:
  ADD r8, r2   ; y++
  CMP r8, r15
  JZ r0, done
  JMP loop_y

done:
  HALT
