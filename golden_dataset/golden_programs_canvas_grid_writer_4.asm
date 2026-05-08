; DESCRIPTION: A colored object centered at the screen with fixed size.

; canvas_grid_writer.asm
; Writes "PIXELS DRIVE PIXELS" to the canvas grid using STORE to 0x8000+

  LDI r11, 0x8000    ; Start of canvas RAM
  LDI r15, string    ; Address of our string
  LDI r4, 1         ; Increment
  
loop:
  LOAD r12, r15       ; Load char from string
  JZ r12, done       ; End of string?
  STORE r11, r12      ; Store to canvas RAM
  ADD r11, r4        ; Next canvas cell
  ADD r15, r4        ; Next char in string
  JMP loop

done:
  HALT

.org 0x100
string:
  .db "PIXELS DRIVE PIXELS", 0
