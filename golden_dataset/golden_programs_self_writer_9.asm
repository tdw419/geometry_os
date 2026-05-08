; DESCRIPTION: This GeOS assembly code writes the string "LDI r6, 42 \n HALT" to a designated area in RAM (canvas), assembles it into executable machine code using the `ASMSELF` instruction, and then runs the newly assembled program at address 0x1000.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r6, 42 \n HALT" to canvas.
; Successor: Sets r6 to 42 and halts.

  LDI r6, 0x8000    ; Start of canvas RAM
  LDI r15, 1         ; Increment
  
  ; Write "LDI r6, 42" to canvas
  LDI r4, 0x4C      ; 'L'
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x44      ; 'D'
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x49      ; 'I'
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x20      ; ' '
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x72      ; 'r'
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x31      ; '1'
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x2C      ; ','
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x20      ; ' '
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x34      ; '4'
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x32      ; '2'
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x0A      ; '\n'
  STORE r6, r4
  ADD r6, r15
  
  ; Write "HALT"
  LDI r4, 0x48      ; 'H'
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x41      ; 'A'
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x4C      ; 'L'
  STORE r6, r4
  ADD r6, r15
  LDI r4, 0x54      ; 'T'
  STORE r6, r4
  ADD r6, r15
  
  ; Null-terminate
  LDI r4, 0
  STORE r6, r4

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
