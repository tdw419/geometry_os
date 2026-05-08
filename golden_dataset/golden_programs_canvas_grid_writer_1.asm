; DESCRIPTION: Display a object using color colored at the screen.

; canvas_grid_writer.asm
; Writes "PIXELS DRIVE PIXELS" to the canvas grid using STORE to 0x8000+

  LDI r4, 0x8000    ; Start of canvas RAM
  LDI r9, string    ; Address of our string
  LDI r8, 1         ; Increment
  
loop:
  LOAD r0, r9       ; Load char from string
  JZ r0, done       ; End of string?
  STORE r4, r0      ; Store to canvas RAM
  ADD r4, r8        ; Next canvas cell
  ADD r9, r8        ; Next char in string
  JMP loop

done:
  HALT

.org 0x100
string:
  .db "PIXELS DRIVE PIXELS", 0
