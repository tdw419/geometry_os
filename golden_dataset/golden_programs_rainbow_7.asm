; DESCRIPTION: This GeOS assembly code generates a diagonal pattern across a screen by iterating over x and y coordinates. Each pixel's color is determined based on the sum of its coordinates modulo 6, cycling through a rainbow palette from red to purple. The pattern repeats until it reaches the specified limit (256).

; RAINBOW -- Diagonal pattern
LDI r10, 0      ; x
LDI r13, 0      ; y
LDI r2, 256    ; limit
LDI r8, 0      ; color (temp)
LDI r15, 1      ; increment
LDI r1, 6      ; color count

loop_y:
  LDI r10, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r12, 0
  ADD r12, r10   ; temp = x
  ADD r12, r13   ; temp = x + y
  MOD r12, r1   ; temp = (x + y) % 6
  
  ; select color from index in r12
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r11, 0
  CMP r12, r11
  JZ r9, set_red
  
  LDI r11, 1
  CMP r12, r11
  JZ r9, set_orange
  
  LDI r11, 2
  CMP r12, r11
  JZ r9, set_yellow
  
  LDI r11, 3
  CMP r12, r11
  JZ r9, set_green
  
  LDI r11, 4
  CMP r12, r11
  JZ r9, set_blue
  
  ; else purple
  LDI r8, 0x800080
  JMP draw

set_red:
  LDI r8, 0xFF0000
  JMP draw
set_orange:
  LDI r8, 0xFFA500
  JMP draw
set_yellow:
  LDI r8, 0xFFFF00
  JMP draw
set_green:
  LDI r8, 0x00FF00
  JMP draw
set_blue:
  LDI r8, 0x0000FF

draw:
  PSET r10, r13, r8
  ADD r10, r15   ; x++
  CMP r10, r2
  JZ r9, next_y
  JMP loop_x

next_y:
  ADD r13, r15   ; y++
  CMP r13, r2
  JZ r9, done
  JMP loop_y

done:
  HALT
