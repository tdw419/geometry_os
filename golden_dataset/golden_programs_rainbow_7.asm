; DESCRIPTION: Display a object using color red at the screen.

; RAINBOW -- Diagonal pattern
LDI r9, 0      ; x
LDI r11, 0      ; y
LDI r0, 256    ; limit
LDI r5, 0      ; color (temp)
LDI r13, 1      ; increment
LDI r14, 6      ; color count

loop_y:
  LDI r9, 0    ; x = 0
loop_x:
  ; color = (x + y) % 6
  LDI r6, 0
  ADD r6, r9   ; temp = x
  ADD r6, r11   ; temp = x + y
  MOD r6, r14   ; temp = (x + y) % 6
  
  ; select color from index in r6
  ; 0: red, 1: orange, 2: yellow, 3: green, 4: blue, 5: purple
  LDI r3, 0
  CMP r6, r3
  JZ r7, set_red
  
  LDI r3, 1
  CMP r6, r3
  JZ r7, set_orange
  
  LDI r3, 2
  CMP r6, r3
  JZ r7, set_yellow
  
  LDI r3, 3
  CMP r6, r3
  JZ r7, set_green
  
  LDI r3, 4
  CMP r6, r3
  JZ r7, set_blue
  
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
  PSET r9, r11, r5
  ADD r9, r13   ; x++
  CMP r9, r0
  JZ r7, next_y
  JMP loop_x

next_y:
  ADD r11, r13   ; y++
  CMP r11, r0
  JZ r7, done
  JMP loop_y

done:
  HALT
