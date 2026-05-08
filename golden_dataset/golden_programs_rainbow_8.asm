; DESCRIPTION: This GeOS assembly code generates a diagonal pattern across a screen by iterating over x and y coordinates. Each pixel's color is determined based on the sum of its coordinates modulo 6, cycling through a rainbow palette from red to purple. The pattern repeats until it reaches the specified limit (256).

; RAINBOW -- Diagonal pattern
LDI r3, 0      ; x
LDI r8, 0      ; y
LDI r13, 256    ; limit
LDI r12, 0      ; color (temp)
LDI r6, 1      ; increment
LDI r0, 6      ; color count

loop_y:
  LDI r3, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r7, 0
  ADD r7, r3   ; temp = x
  ADD r7, r8   ; temp = x + y
  MOD r7, r0   ; temp = (x + y) % 6
  
  ; select color from index in r7
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r5, 0
  CMP r7, r5
  JZ r4, set_red
  
  LDI r5, 1
  CMP r7, r5
  JZ r4, set_orange
  
  LDI r5, 2
  CMP r7, r5
  JZ r4, set_yellow
  
  LDI r5, 3
  CMP r7, r5
  JZ r4, set_green
  
  LDI r5, 4
  CMP r7, r5
  JZ r4, set_blue
  
  ; else purple
  LDI r12, 0x800080
  JMP draw

set_red:
  LDI r12, 0xFF0000
  JMP draw
set_orange:
  LDI r12, 0xFFA500
  JMP draw
set_yellow:
  LDI r12, 0xFFFF00
  JMP draw
set_green:
  LDI r12, 0x00FF00
  JMP draw
set_blue:
  LDI r12, 0x0000FF

draw:
  PSET r3, r8, r12
  ADD r3, r6   ; x++
  CMP r3, r13
  JZ r4, next_y
  JMP loop_x

next_y:
  ADD r8, r6   ; y++
  CMP r8, r13
  JZ r4, done
  JMP loop_y

done:
  HALT
