; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r4, 42 \n HALT" to canvas.
; Successor: Sets r4 to 42 and halts.

  LDI r4, 0x8000    ; Start of canvas RAM
  LDI r7, 1         ; Increment
  
  ; Write "LDI r4, 42" to canvas
  LDI r0, 0x4C      ; 'L'
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x44      ; 'D'
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x49      ; 'I'
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x20      ; ' '
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x72      ; 'r'
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x31      ; '1'
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x2C      ; ','
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x20      ; ' '
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x34      ; '4'
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x32      ; '2'
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x0A      ; '\n'
  STORE r4, r0
  ADD r4, r7
  
  ; Write "HALT"
  LDI r0, 0x48      ; 'H'
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x41      ; 'A'
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x4C      ; 'L'
  STORE r4, r0
  ADD r4, r7
  LDI r0, 0x54      ; 'T'
  STORE r4, r0
  ADD r4, r7
  
  ; Null-terminate
  LDI r0, 0
  STORE r4, r0

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
