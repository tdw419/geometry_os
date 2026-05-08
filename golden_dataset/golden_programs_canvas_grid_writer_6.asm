; DESCRIPTION: Display a object using color colored at the screen.

; canvas_grid_writer.asm
; Writes "PIXELS DRIVE PIXELS" to the canvas grid using STORE to 0x8000+

  LDI r6, 0x8000    ; Start of canvas RAM
  LDI r12, string    ; Address of our string
  LDI r14, 1         ; Increment
  
loop:
  LOAD r1, r12       ; Load char from string
  JZ r1, done       ; End of string?
  STORE r6, r1      ; Store to canvas RAM
  ADD r6, r14        ; Next canvas cell
  ADD r12, r14        ; Next char in string
  JMP loop

done:
  HALT

.org 0x100
string:
  .db "PIXELS DRIVE PIXELS", 0
