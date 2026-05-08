; DESCRIPTION: Display a object using color colored at the screen.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r9, 42 \n HALT" to canvas.
; Successor: Sets r9 to 42 and halts.

  LDI r9, 0x8000    ; Start of canvas RAM
  LDI r15, 1         ; Increment
  
  ; Write "LDI r9, 42" to canvas
  LDI r10, 0x4C      ; 'L'
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x44      ; 'D'
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x49      ; 'I'
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x20      ; ' '
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x72      ; 'r'
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x31      ; '1'
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x2C      ; ','
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x20      ; ' '
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x34      ; '4'
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x32      ; '2'
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x0A      ; '\n'
  STORE r9, r10
  ADD r9, r15
  
  ; Write "HALT"
  LDI r10, 0x48      ; 'H'
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x41      ; 'A'
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x4C      ; 'L'
  STORE r9, r10
  ADD r9, r15
  LDI r10, 0x54      ; 'T'
  STORE r9, r10
  ADD r9, r15
  
  ; Null-terminate
  LDI r10, 0
  STORE r9, r10

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
