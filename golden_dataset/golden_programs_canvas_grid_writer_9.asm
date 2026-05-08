; DESCRIPTION: Geometry OS program to draw a colored object.

; canvas_grid_writer.asm
; Writes "PIXELS DRIVE PIXELS" to the canvas grid using STORE to 0x8000+

  LDI r13, 0x8000    ; Start of canvas RAM
  LDI r4, string    ; Address of our string
  LDI r14, 1         ; Increment
  
loop:
  LOAD r11, r4       ; Load char from string
  JZ r11, done       ; End of string?
  STORE r13, r11      ; Store to canvas RAM
  ADD r13, r14        ; Next canvas cell
  ADD r4, r14        ; Next char in string
  JMP loop

done:
  HALT

.org 0x100
string:
  .db "PIXELS DRIVE PIXELS", 0
