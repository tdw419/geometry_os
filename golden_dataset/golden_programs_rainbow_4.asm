; DESCRIPTION: This GeOS assembly code generates a diagonal pattern across a screen by iterating over x and y coordinates. Each pixel's color is determined based on the sum of its coordinates modulo 6, cycling through a rainbow palette from red to purple. The pattern repeats until it reaches the specified limit (256).

; RAINBOW -- Diagonal pattern
LDI r3, 0      ; x
LDI r8, 0      ; y
LDI r14, 256    ; limit
LDI r12, 0      ; color (temp)
LDI r0, 1      ; increment
LDI r1, 6      ; color count

loop_y:
  LDI r3, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r6, 0
  ADD r6, r3   ; temp = x
  ADD r6, r8   ; temp = x + y
  MOD r6, r1   ; temp = (x + y) % 6
  
  ; select color from index in r6
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r7, 0
  CMP r6, r7
  JZ r4, set_red
  
  LDI r7, 1
  CMP r6, r7
  JZ r4, set_orange
  
  LDI r7, 2
  CMP r6, r7
  JZ r4, set_yellow
  
  LDI r7, 3
  CMP r6, r7
  JZ r4, set_green
  
  LDI r7, 4
  CMP r6, r7
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
  ADD r3, r0   ; x++
  CMP r3, r14
  JZ r4, next_y
  JMP loop_x

next_y:
  ADD r8, r0   ; y++
  CMP r8, r14
  JZ r4, done
  JMP loop_y

done:
  HALT
