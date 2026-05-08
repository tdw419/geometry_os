; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; RAINBOW -- Diagonal pattern
LDI r4, 0      ; x
LDI r6, 0      ; y
LDI r11, 256    ; limit
LDI r1, 0      ; color (temp)
LDI r7, 1      ; increment
LDI r5, 6      ; color count

loop_y:
  LDI r4, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r8, 0
  ADD r8, r4   ; temp = x
  ADD r8, r6   ; temp = x + y
  MOD r8, r5   ; temp = (x + y) % 6
  
  ; select color from index in r8
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r3, 0
  CMP r8, r3
  JZ r15, set_red
  
  LDI r3, 1
  CMP r8, r3
  JZ r15, set_orange
  
  LDI r3, 2
  CMP r8, r3
  JZ r15, set_yellow
  
  LDI r3, 3
  CMP r8, r3
  JZ r15, set_green
  
  LDI r3, 4
  CMP r8, r3
  JZ r15, set_blue
  
  ; else purple
  LDI r1, 0x800080
  JMP draw

set_red:
  LDI r1, 0xFF0000
  JMP draw
set_orange:
  LDI r1, 0xFFA500
  JMP draw
set_yellow:
  LDI r1, 0xFFFF00
  JMP draw
set_green:
  LDI r1, 0x00FF00
  JMP draw
set_blue:
  LDI r1, 0x0000FF

draw:
  PSET r4, r6, r1
  ADD r4, r7   ; x++
  CMP r4, r11
  JZ r15, next_y
  JMP loop_x

next_y:
  ADD r6, r7   ; y++
  CMP r6, r11
  JZ r15, done
  JMP loop_y

done:
  HALT
