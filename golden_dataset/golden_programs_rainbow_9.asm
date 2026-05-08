; DESCRIPTION: This GeOS assembly code generates a diagonal pattern across a screen by iterating over x and y coordinates. Each pixel's color is determined based on the sum of its coordinates modulo 6, cycling through a rainbow palette from red to purple. The pattern repeats until it reaches the specified limit (256).

; RAINBOW -- Diagonal pattern
LDI r11, 0      ; x
LDI r3, 0      ; y
LDI r6, 256    ; limit
LDI r0, 0      ; color (temp)
LDI r2, 1      ; increment
LDI r7, 6      ; color count

loop_y:
  LDI r11, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r14, 0
  ADD r14, r11   ; temp = x
  ADD r14, r3   ; temp = x + y
  MOD r14, r7   ; temp = (x + y) % 6
  
  ; select color from index in r14
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r5, 0
  CMP r14, r5
  JZ r13, set_red
  
  LDI r5, 1
  CMP r14, r5
  JZ r13, set_orange
  
  LDI r5, 2
  CMP r14, r5
  JZ r13, set_yellow
  
  LDI r5, 3
  CMP r14, r5
  JZ r13, set_green
  
  LDI r5, 4
  CMP r14, r5
  JZ r13, set_blue
  
  ; else purple
  LDI r0, 0x800080
  JMP draw

set_red:
  LDI r0, 0xFF0000
  JMP draw
set_orange:
  LDI r0, 0xFFA500
  JMP draw
set_yellow:
  LDI r0, 0xFFFF00
  JMP draw
set_green:
  LDI r0, 0x00FF00
  JMP draw
set_blue:
  LDI r0, 0x0000FF

draw:
  PSET r11, r3, r0
  ADD r11, r2   ; x++
  CMP r11, r6
  JZ r13, next_y
  JMP loop_x

next_y:
  ADD r3, r2   ; y++
  CMP r3, r6
  JZ r13, done
  JMP loop_y

done:
  HALT
