; DESCRIPTION: This GeOS assembly code generates a diagonal pattern across a screen by iterating over x and y coordinates. Each pixel's color is determined based on the sum of its coordinates modulo 6, cycling through a rainbow palette from red to purple. The pattern repeats until it reaches the specified limit (256).

; RAINBOW -- Diagonal pattern
LDI r0, 0      ; x
LDI r11, 0      ; y
LDI r4, 256    ; limit
LDI r1, 0      ; color (temp)
LDI r3, 1      ; increment
LDI r2, 6      ; color count

loop_y:
  LDI r0, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r13, 0
  ADD r13, r0   ; temp = x
  ADD r13, r11   ; temp = x + y
  MOD r13, r2   ; temp = (x + y) % 6
  
  ; select color from index in r13
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r12, 0
  CMP r13, r12
  JZ r7, set_red
  
  LDI r12, 1
  CMP r13, r12
  JZ r7, set_orange
  
  LDI r12, 2
  CMP r13, r12
  JZ r7, set_yellow
  
  LDI r12, 3
  CMP r13, r12
  JZ r7, set_green
  
  LDI r12, 4
  CMP r13, r12
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
  PSET r0, r11, r1
  ADD r0, r3   ; x++
  CMP r0, r4
  JZ r7, next_y
  JMP loop_x

next_y:
  ADD r11, r3   ; y++
  CMP r11, r4
  JZ r7, done
  JMP loop_y

done:
  HALT
