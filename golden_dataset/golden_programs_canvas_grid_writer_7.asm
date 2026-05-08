; DESCRIPTION: Geometry OS program to draw a colored object.

; canvas_grid_writer.asm
; Writes "PIXELS DRIVE PIXELS" to the canvas grid using STORE to 0x8000+

  LDI r8, 0x8000    ; Start of canvas RAM
  LDI r9, string    ; Address of our string
  LDI r3, 1         ; Increment
  
loop:
  LOAD r12, r9       ; Load char from string
  JZ r12, done       ; End of string?
  STORE r8, r12      ; Store to canvas RAM
  ADD r8, r3        ; Next canvas cell
  ADD r9, r3        ; Next char in string
  JMP loop

done:
  HALT

.org 0x100
string:
  .db "PIXELS DRIVE PIXELS", 0
