; DESCRIPTION: Geometry OS program to draw a colored object.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r13, 42 \n HALT" to canvas.
; Successor: Sets r13 to 42 and halts.

  LDI r13, 0x8000    ; Start of canvas RAM
  LDI r1, 1         ; Increment
  
  ; Write "LDI r13, 42" to canvas
  LDI r12, 0x4C      ; 'L'
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x44      ; 'D'
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x49      ; 'I'
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x20      ; ' '
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x72      ; 'r'
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x31      ; '1'
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x2C      ; ','
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x20      ; ' '
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x34      ; '4'
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x32      ; '2'
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x0A      ; '\n'
  STORE r13, r12
  ADD r13, r1
  
  ; Write "HALT"
  LDI r12, 0x48      ; 'H'
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x41      ; 'A'
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x4C      ; 'L'
  STORE r13, r12
  ADD r13, r1
  LDI r12, 0x54      ; 'T'
  STORE r13, r12
  ADD r13, r1
  
  ; Null-terminate
  LDI r12, 0
  STORE r13, r12

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
