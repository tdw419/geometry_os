; DESCRIPTION: This GeOS assembly code writes the string "LDI r5, 42 \n HALT" to a designated area in RAM (canvas), assembles it into executable machine code using the `ASMSELF` instruction, and then runs the newly assembled program at address 0x1000.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r5, 42 \n HALT" to canvas.
; Successor: Sets r5 to 42 and halts.

  LDI r5, 0x8000    ; Start of canvas RAM
  LDI r13, 1         ; Increment
  
  ; Write "LDI r5, 42" to canvas
  LDI r6, 0x4C      ; 'L'
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x44      ; 'D'
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x49      ; 'I'
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x20      ; ' '
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x72      ; 'r'
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x31      ; '1'
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x2C      ; ','
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x20      ; ' '
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x34      ; '4'
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x32      ; '2'
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x0A      ; '\n'
  STORE r5, r6
  ADD r5, r13
  
  ; Write "HALT"
  LDI r6, 0x48      ; 'H'
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x41      ; 'A'
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x4C      ; 'L'
  STORE r5, r6
  ADD r5, r13
  LDI r6, 0x54      ; 'T'
  STORE r5, r6
  ADD r5, r13
  
  ; Null-terminate
  LDI r6, 0
  STORE r5, r6

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
