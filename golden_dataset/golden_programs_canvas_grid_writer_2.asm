; DESCRIPTION: Geometry OS program to draw a colored object.

; canvas_grid_writer.asm
; Writes "PIXELS DRIVE PIXELS" to the canvas grid using STORE to 0x8000+

  LDI r12, 0x8000    ; Start of canvas RAM
  LDI r3, string    ; Address of our string
  LDI r14, 1         ; Increment
  
loop:
  LOAD r5, r3       ; Load char from string
  JZ r5, done       ; End of string?
  STORE r12, r5      ; Store to canvas RAM
  ADD r12, r14        ; Next canvas cell
  ADD r3, r14        ; Next char in string
  JMP loop

done:
  HALT

.org 0x100
string:
  .db "PIXELS DRIVE PIXELS", 0
