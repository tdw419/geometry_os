; DESCRIPTION: This GeOS assembly code generates a diagonal pattern across a screen by iterating over x and y coordinates. Each pixel's color is determined based on the sum of its coordinates modulo 6, cycling through a rainbow palette from red to purple. The pattern repeats until it reaches the specified limit (256).

; RAINBOW -- Diagonal pattern
LDI r14, 0      ; x
LDI r6, 0      ; y
LDI r12, 256    ; limit
LDI r2, 0      ; color (temp)
LDI r4, 1      ; increment
LDI r15, 6      ; color count

loop_y:
  LDI r14, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r0, 0
  ADD r0, r14   ; temp = x
  ADD r0, r6   ; temp = x + y
  MOD r0, r15   ; temp = (x + y) % 6
  
  ; select color from index in r0
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r7, 0
  CMP r0, r7
  JZ r9, set_red
  
  LDI r7, 1
  CMP r0, r7
  JZ r9, set_orange
  
  LDI r7, 2
  CMP r0, r7
  JZ r9, set_yellow
  
  LDI r7, 3
  CMP r0, r7
  JZ r9, set_green
  
  LDI r7, 4
  CMP r0, r7
  JZ r9, set_blue
  
  ; else purple
  LDI r2, 0x800080
  JMP draw

set_red:
  LDI r2, 0xFF0000
  JMP draw
set_orange:
  LDI r2, 0xFFA500
  JMP draw
set_yellow:
  LDI r2, 0xFFFF00
  JMP draw
set_green:
  LDI r2, 0x00FF00
  JMP draw
set_blue:
  LDI r2, 0x0000FF

draw:
  PSET r14, r6, r2
  ADD r14, r4   ; x++
  CMP r14, r12
  JZ r9, next_y
  JMP loop_x

next_y:
  ADD r6, r4   ; y++
  CMP r6, r12
  JZ r9, done
  JMP loop_y

done:
  HALT
