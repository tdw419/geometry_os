; DESCRIPTION: This GeOS assembly code writes the string "LDI r1, 42 \n HALT" to a designated area in RAM (canvas), assembles it into executable machine code using the `ASMSELF` instruction, and then runs the newly assembled program at address 0x1000.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r1, 42 \n HALT" to canvas.
; Successor: Sets r1 to 42 and halts.

  LDI r1, 0x8000    ; Start of canvas RAM
  LDI r13, 1         ; Increment
  
  ; Write "LDI r1, 42" to canvas
  LDI r15, 0x4C      ; 'L'
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x44      ; 'D'
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x49      ; 'I'
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x20      ; ' '
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x72      ; 'r'
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x31      ; '1'
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x2C      ; ','
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x20      ; ' '
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x34      ; '4'
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x32      ; '2'
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x0A      ; '\n'
  STORE r1, r15
  ADD r1, r13
  
  ; Write "HALT"
  LDI r15, 0x48      ; 'H'
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x41      ; 'A'
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x4C      ; 'L'
  STORE r1, r15
  ADD r1, r13
  LDI r15, 0x54      ; 'T'
  STORE r1, r15
  ADD r1, r13
  
  ; Null-terminate
  LDI r15, 0
  STORE r1, r15

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
