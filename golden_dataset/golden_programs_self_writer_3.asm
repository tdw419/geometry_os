; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r12, 42 \n HALT" to canvas.
; Successor: Sets r12 to 42 and halts.

  LDI r12, 0x8000    ; Start of canvas RAM
  LDI r9, 1         ; Increment
  
  ; Write "LDI r12, 42" to canvas
  LDI r7, 0x4C      ; 'L'
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x44      ; 'D'
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x49      ; 'I'
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x20      ; ' '
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x72      ; 'r'
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x31      ; '1'
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x2C      ; ','
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x20      ; ' '
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x34      ; '4'
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x32      ; '2'
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x0A      ; '\n'
  STORE r12, r7
  ADD r12, r9
  
  ; Write "HALT"
  LDI r7, 0x48      ; 'H'
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x41      ; 'A'
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x4C      ; 'L'
  STORE r12, r7
  ADD r12, r9
  LDI r7, 0x54      ; 'T'
  STORE r12, r7
  ADD r12, r9
  
  ; Null-terminate
  LDI r7, 0
  STORE r12, r7

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
