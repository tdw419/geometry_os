; DESCRIPTION: Draws a red object at the screen with fixed size.

; RAINBOW -- Diagonal pattern
LDI r13, 0      ; x
LDI r14, 0      ; y
LDI r5, 256    ; limit
LDI r8, 0      ; color (temp)
LDI r10, 1      ; increment
LDI r0, 6      ; color count

loop_y:
  LDI r13, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r4, 0
  ADD r4, r13   ; temp = x
  ADD r4, r14   ; temp = x + y
  MOD r4, r0   ; temp = (x + y) % 6
  
  ; select color from index in r4
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r9, 0
  CMP r4, r9
  JZ r12, set_red
  
  LDI r9, 1
  CMP r4, r9
  JZ r12, set_orange
  
  LDI r9, 2
  CMP r4, r9
  JZ r12, set_yellow
  
  LDI r9, 3
  CMP r4, r9
  JZ r12, set_green
  
  LDI r9, 4
  CMP r4, r9
  JZ r12, set_blue
  
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
  PSET r13, r14, r8
  ADD r13, r10   ; x++
  CMP r13, r5
  JZ r12, next_y
  JMP loop_x

next_y:
  ADD r14, r10   ; y++
  CMP r14, r5
  JZ r12, done
  JMP loop_y

done:
  HALT
