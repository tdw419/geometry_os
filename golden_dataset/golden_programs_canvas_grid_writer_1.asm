; DESCRIPTION: This GeOS assembly code writes the string "PIXELS DRIVE PIXELS" to a canvas grid starting at memory address 0x8000 by sequentially loading characters from the string and storing them into consecutive memory locations in the canvas RAM. The process continues until it reaches the null terminator of the string, at which point the program halts execution.

; canvas_grid_writer.asm
; Writes "PIXELS DRIVE PIXELS" to the canvas grid using STORE to 0x8000+

  LDI r8, 0x8000    ; Start of canvas RAM
  LDI r2, string    ; Address of our string
  LDI r6, 1         ; Increment
  
loop:
  LOAD r13, r2       ; Load char from string
  JZ r13, done       ; End of string?
  STORE r8, r13      ; Store to canvas RAM
  ADD r8, r6        ; Next canvas cell
  ADD r2, r6        ; Next char in string
  JMP loop

done:
  HALT

.org 0x100
string:
  .db "PIXELS DRIVE PIXELS", 0
