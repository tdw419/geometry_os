; DESCRIPTION: Render a red object at the screen.

; RAINBOW -- Diagonal pattern
LDI r9, 0      ; x
LDI r3, 0      ; y
LDI r4, 256    ; limit
LDI r5, 0      ; color (temp)
LDI r15, 1      ; increment
LDI r8, 6      ; color count

loop_y:
  LDI r9, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r0, 0
  ADD r0, r9   ; temp = x
  ADD r0, r3   ; temp = x + y
  MOD r0, r8   ; temp = (x + y) % 6
  
  ; select color from index in r0
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r13, 0
  CMP r0, r13
  JZ r6, set_red
  
  LDI r13, 1
  CMP r0, r13
  JZ r6, set_orange
  
  LDI r13, 2
  CMP r0, r13
  JZ r6, set_yellow
  
  LDI r13, 3
  CMP r0, r13
  JZ r6, set_green
  
  LDI r13, 4
  CMP r0, r13
  JZ r6, set_blue
  
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
  PSET r9, r3, r5
  ADD r9, r15   ; x++
  CMP r9, r4
  JZ r6, next_y
  JMP loop_x

next_y:
  ADD r3, r15   ; y++
  CMP r3, r4
  JZ r6, done
  JMP loop_y

done:
  HALT
