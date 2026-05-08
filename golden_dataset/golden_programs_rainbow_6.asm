; DESCRIPTION: This GeOS assembly code generates a diagonal pattern across a screen by iterating over x and y coordinates. Each pixel's color is determined based on the sum of its coordinates modulo 6, cycling through a rainbow palette from red to purple. The pattern repeats until it reaches the specified limit (256).

; RAINBOW -- Diagonal pattern
LDI r14, 0      ; x
LDI r10, 0      ; y
LDI r12, 256    ; limit
LDI r9, 0      ; color (temp)
LDI r15, 1      ; increment
LDI r11, 6      ; color count

loop_y:
  LDI r14, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r3, 0
  ADD r3, r14   ; temp = x
  ADD r3, r10   ; temp = x + y
  MOD r3, r11   ; temp = (x + y) % 6
  
  ; select color from index in r3
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r1, 0
  CMP r3, r1
  JZ r7, set_red
  
  LDI r1, 1
  CMP r3, r1
  JZ r7, set_orange
  
  LDI r1, 2
  CMP r3, r1
  JZ r7, set_yellow
  
  LDI r1, 3
  CMP r3, r1
  JZ r7, set_green
  
  LDI r1, 4
  CMP r3, r1
  JZ r7, set_blue
  
  ; else purple
  LDI r9, 0x800080
  JMP draw

set_red:
  LDI r9, 0xFF0000
  JMP draw
set_orange:
  LDI r9, 0xFFA500
  JMP draw
set_yellow:
  LDI r9, 0xFFFF00
  JMP draw
set_green:
  LDI r9, 0x00FF00
  JMP draw
set_blue:
  LDI r9, 0x0000FF

draw:
  PSET r14, r10, r9
  ADD r14, r15   ; x++
  CMP r14, r12
  JZ r7, next_y
  JMP loop_x

next_y:
  ADD r10, r15   ; y++
  CMP r10, r12
  JZ r7, done
  JMP loop_y

done:
  HALT
