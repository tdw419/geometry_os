; DESCRIPTION: This GeOS assembly code writes the string "LDI r3, 42 \n HALT" to a designated area in RAM (canvas), assembles it into executable machine code using the `ASMSELF` instruction, and then runs the newly assembled program at address 0x1000.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r3, 42 \n HALT" to canvas.
; Successor: Sets r3 to 42 and halts.

  LDI r3, 0x8000    ; Start of canvas RAM
  LDI r2, 1         ; Increment
  
  ; Write "LDI r3, 42" to canvas
  LDI r13, 0x4C      ; 'L'
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x44      ; 'D'
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x49      ; 'I'
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x20      ; ' '
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x72      ; 'r'
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x31      ; '1'
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x2C      ; ','
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x20      ; ' '
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x34      ; '4'
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x32      ; '2'
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x0A      ; '\n'
  STORE r3, r13
  ADD r3, r2
  
  ; Write "HALT"
  LDI r13, 0x48      ; 'H'
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x41      ; 'A'
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x4C      ; 'L'
  STORE r3, r13
  ADD r3, r2
  LDI r13, 0x54      ; 'T'
  STORE r3, r13
  ADD r3, r2
  
  ; Null-terminate
  LDI r13, 0
  STORE r3, r13

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
