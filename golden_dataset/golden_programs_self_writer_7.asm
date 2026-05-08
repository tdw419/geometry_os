; DESCRIPTION: A colored object centered at the screen with fixed size.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r3, 42 \n HALT" to canvas.
; Successor: Sets r3 to 42 and halts.

  LDI r3, 0x8000    ; Start of canvas RAM
  LDI r6, 1         ; Increment
  
  ; Write "LDI r3, 42" to canvas
  LDI r8, 0x4C      ; 'L'
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x44      ; 'D'
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x49      ; 'I'
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x20      ; ' '
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x72      ; 'r'
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x31      ; '1'
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x2C      ; ','
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x20      ; ' '
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x34      ; '4'
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x32      ; '2'
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x0A      ; '\n'
  STORE r3, r8
  ADD r3, r6
  
  ; Write "HALT"
  LDI r8, 0x48      ; 'H'
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x41      ; 'A'
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x4C      ; 'L'
  STORE r3, r8
  ADD r3, r6
  LDI r8, 0x54      ; 'T'
  STORE r3, r8
  ADD r3, r6
  
  ; Null-terminate
  LDI r8, 0
  STORE r3, r8

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
