; DESCRIPTION: This GeOS assembly code generates a diagonal pattern across a screen by iterating over x and y coordinates. Each pixel's color is determined based on the sum of its coordinates modulo 6, cycling through a rainbow palette from red to purple. The pattern repeats until it reaches the specified limit (256).

; RAINBOW -- Diagonal pattern
LDI r13, 0      ; x
LDI r2, 0      ; y
LDI r5, 256    ; limit
LDI r8, 0      ; color (temp)
LDI r3, 1      ; increment
LDI r9, 6      ; color count

loop_y:
  LDI r13, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r4, 0
  ADD r4, r13   ; temp = x
  ADD r4, r2   ; temp = x + y
  MOD r4, r9   ; temp = (x + y) % 6
  
  ; select color from index in r4
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r10, 0
  CMP r4, r10
  JZ r0, set_red
  
  LDI r10, 1
  CMP r4, r10
  JZ r0, set_orange
  
  LDI r10, 2
  CMP r4, r10
  JZ r0, set_yellow
  
  LDI r10, 3
  CMP r4, r10
  JZ r0, set_green
  
  LDI r10, 4
  CMP r4, r10
  JZ r0, set_blue
  
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
  PSET r13, r2, r8
  ADD r13, r3   ; x++
  CMP r13, r5
  JZ r0, next_y
  JMP loop_x

next_y:
  ADD r2, r3   ; y++
  CMP r2, r5
  JZ r0, done
  JMP loop_y

done:
  HALT
