; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; RAINBOW -- Diagonal pattern
LDI r2, 0      ; x
LDI r15, 0      ; y
LDI r1, 256    ; limit
LDI r4, 0      ; color (temp)
LDI r12, 1      ; increment
LDI r3, 6      ; color count

loop_y:
  LDI r2, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r9, 0
  ADD r9, r2   ; temp = x
  ADD r9, r15   ; temp = x + y
  MOD r9, r3   ; temp = (x + y) % 6
  
  ; select color from index in r9
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r11, 0
  CMP r9, r11
  JZ r8, set_red
  
  LDI r11, 1
  CMP r9, r11
  JZ r8, set_orange
  
  LDI r11, 2
  CMP r9, r11
  JZ r8, set_yellow
  
  LDI r11, 3
  CMP r9, r11
  JZ r8, set_green
  
  LDI r11, 4
  CMP r9, r11
  JZ r8, set_blue
  
  ; else purple
  LDI r4, 0x800080
  JMP draw

set_red:
  LDI r4, 0xFF0000
  JMP draw
set_orange:
  LDI r4, 0xFFA500
  JMP draw
set_yellow:
  LDI r4, 0xFFFF00
  JMP draw
set_green:
  LDI r4, 0x00FF00
  JMP draw
set_blue:
  LDI r4, 0x0000FF

draw:
  PSET r2, r15, r4
  ADD r2, r12   ; x++
  CMP r2, r1
  JZ r8, next_y
  JMP loop_x

next_y:
  ADD r15, r12   ; y++
  CMP r15, r1
  JZ r8, done
  JMP loop_y

done:
  HALT
