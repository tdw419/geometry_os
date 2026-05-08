; DESCRIPTION: Draws a red object at the screen with fixed size.

; RAINBOW -- Diagonal pattern
LDI r12, 0      ; x
LDI r4, 0      ; y
LDI r8, 256    ; limit
LDI r5, 0      ; color (temp)
LDI r1, 1      ; increment
LDI r14, 6      ; color count

loop_y:
  LDI r12, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r11, 0
  ADD r11, r12   ; temp = x
  ADD r11, r4   ; temp = x + y
  MOD r11, r14   ; temp = (x + y) % 6
  
  ; select color from index in r11
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r6, 0
  CMP r11, r6
  JZ r7, set_red
  
  LDI r6, 1
  CMP r11, r6
  JZ r7, set_orange
  
  LDI r6, 2
  CMP r11, r6
  JZ r7, set_yellow
  
  LDI r6, 3
  CMP r11, r6
  JZ r7, set_green
  
  LDI r6, 4
  CMP r11, r6
  JZ r7, set_blue
  
  ; else purple
  LDI r5, 0x800080
  JMP draw

set_red:
  LDI r5, 0xFF0000
  JMP draw
set_orange:
  LDI r5, 0xFFA500
  JMP draw
set_yellow:
  LDI r5, 0xFFFF00
  JMP draw
set_green:
  LDI r5, 0x00FF00
  JMP draw
set_blue:
  LDI r5, 0x0000FF

draw:
  PSET r12, r4, r5
  ADD r12, r1   ; x++
  CMP r12, r8
  JZ r7, next_y
  JMP loop_x

next_y:
  ADD r4, r1   ; y++
  CMP r4, r8
  JZ r7, done
  JMP loop_y

done:
  HALT
