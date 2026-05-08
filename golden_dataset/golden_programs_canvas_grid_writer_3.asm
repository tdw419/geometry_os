; DESCRIPTION: Display a object using color colored at the screen.

; canvas_grid_writer.asm
; Writes "PIXELS DRIVE PIXELS" to the canvas grid using STORE to 0x8000+

  LDI r6, 0x8000    ; Start of canvas RAM
  LDI r5, string    ; Address of our string
  LDI r10, 1         ; Increment
  
loop:
  LOAD r11, r5       ; Load char from string
  JZ r11, done       ; End of string?
  STORE r6, r11      ; Store to canvas RAM
  ADD r6, r10        ; Next canvas cell
  ADD r5, r10        ; Next char in string
  JMP loop

done:
  HALT

.org 0x100
string:
  .db "PIXELS DRIVE PIXELS", 0
