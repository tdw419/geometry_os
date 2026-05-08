; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; RAINBOW -- Diagonal pattern
LDI r10, 0      ; x
LDI r3, 0      ; y
LDI r14, 256    ; limit
LDI r13, 0      ; color (temp)
LDI r11, 1      ; increment
LDI r2, 6      ; color count

loop_y:
  LDI r10, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r7, 0
  ADD r7, r10   ; temp = x
  ADD r7, r3   ; temp = x + y
  MOD r7, r2   ; temp = (x + y) % 6
  
  ; select color from index in r7
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r8, 0
  CMP r7, r8
  JZ r0, set_red
  
  LDI r8, 1
  CMP r7, r8
  JZ r0, set_orange
  
  LDI r8, 2
  CMP r7, r8
  JZ r0, set_yellow
  
  LDI r8, 3
  CMP r7, r8
  JZ r0, set_green
  
  LDI r8, 4
  CMP r7, r8
  JZ r0, set_blue
  
  ; else purple
  LDI r13, 0x800080
  JMP draw

set_red:
  LDI r13, 0xFF0000
  JMP draw
set_orange:
  LDI r13, 0xFFA500
  JMP draw
set_yellow:
  LDI r13, 0xFFFF00
  JMP draw
set_green:
  LDI r13, 0x00FF00
  JMP draw
set_blue:
  LDI r13, 0x0000FF

draw:
  PSET r10, r3, r13
  ADD r10, r11   ; x++
  CMP r10, r14
  JZ r0, next_y
  JMP loop_x

next_y:
  ADD r3, r11   ; y++
  CMP r3, r14
  JZ r0, done
  JMP loop_y

done:
  HALT
