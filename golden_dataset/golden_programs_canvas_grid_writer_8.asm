; DESCRIPTION: Render a colored object at the screen.

; canvas_grid_writer.asm
; Writes "PIXELS DRIVE PIXELS" to the canvas grid using STORE to 0x8000+

  LDI r3, 0x8000    ; Start of canvas RAM
  LDI r5, string    ; Address of our string
  LDI r2, 1         ; Increment
  
loop:
  LOAD r7, r5       ; Load char from string
  JZ r7, done       ; End of string?
  STORE r3, r7      ; Store to canvas RAM
  ADD r3, r2        ; Next canvas cell
  ADD r5, r2        ; Next char in string
  JMP loop

done:
  HALT

.org 0x100
string:
  .db "PIXELS DRIVE PIXELS", 0
