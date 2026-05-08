; DESCRIPTION: Render a colored object at the screen.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r2, 42 \n HALT" to canvas.
; Successor: Sets r2 to 42 and halts.

  LDI r2, 0x8000    ; Start of canvas RAM
  LDI r13, 1         ; Increment
  
  ; Write "LDI r2, 42" to canvas
  LDI r3, 0x4C      ; 'L'
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x44      ; 'D'
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x49      ; 'I'
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x20      ; ' '
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x72      ; 'r'
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x31      ; '1'
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x2C      ; ','
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x20      ; ' '
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x34      ; '4'
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x32      ; '2'
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x0A      ; '\n'
  STORE r2, r3
  ADD r2, r13
  
  ; Write "HALT"
  LDI r3, 0x48      ; 'H'
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x41      ; 'A'
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x4C      ; 'L'
  STORE r2, r3
  ADD r2, r13
  LDI r3, 0x54      ; 'T'
  STORE r2, r3
  ADD r2, r13
  
  ; Null-terminate
  LDI r3, 0
  STORE r2, r3

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
