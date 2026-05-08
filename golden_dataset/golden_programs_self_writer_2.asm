; DESCRIPTION: Display a object using color colored at the screen.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r8, 42 \n HALT" to canvas.
; Successor: Sets r8 to 42 and halts.

  LDI r8, 0x8000    ; Start of canvas RAM
  LDI r1, 1         ; Increment
  
  ; Write "LDI r8, 42" to canvas
  LDI r14, 0x4C      ; 'L'
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x44      ; 'D'
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x49      ; 'I'
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x20      ; ' '
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x72      ; 'r'
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x31      ; '1'
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x2C      ; ','
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x20      ; ' '
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x34      ; '4'
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x32      ; '2'
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x0A      ; '\n'
  STORE r8, r14
  ADD r8, r1
  
  ; Write "HALT"
  LDI r14, 0x48      ; 'H'
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x41      ; 'A'
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x4C      ; 'L'
  STORE r8, r14
  ADD r8, r1
  LDI r14, 0x54      ; 'T'
  STORE r8, r14
  ADD r8, r1
  
  ; Null-terminate
  LDI r14, 0
  STORE r8, r14

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
