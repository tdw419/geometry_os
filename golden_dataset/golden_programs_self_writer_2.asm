; DESCRIPTION: This GeOS assembly code writes the string "LDI r13, 42 \n HALT" to a designated area in RAM (canvas), assembles it into executable machine code using the `ASMSELF` instruction, and then runs the newly assembled program at address 0x1000.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r13, 42 \n HALT" to canvas.
; Successor: Sets r13 to 42 and halts.

  LDI r13, 0x8000    ; Start of canvas RAM
  LDI r5, 1         ; Increment
  
  ; Write "LDI r13, 42" to canvas
  LDI r10, 0x4C      ; 'L'
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x44      ; 'D'
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x49      ; 'I'
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x20      ; ' '
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x72      ; 'r'
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x31      ; '1'
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x2C      ; ','
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x20      ; ' '
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x34      ; '4'
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x32      ; '2'
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x0A      ; '\n'
  STORE r13, r10
  ADD r13, r5
  
  ; Write "HALT"
  LDI r10, 0x48      ; 'H'
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x41      ; 'A'
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x4C      ; 'L'
  STORE r13, r10
  ADD r13, r5
  LDI r10, 0x54      ; 'T'
  STORE r13, r10
  ADD r13, r5
  
  ; Null-terminate
  LDI r10, 0
  STORE r13, r10

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
