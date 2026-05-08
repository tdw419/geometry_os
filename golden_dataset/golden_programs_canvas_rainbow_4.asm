; DESCRIPTION: Draws a colored object at the screen with fixed size.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r0, 0x8000    ; canvas buffer start
  LDI r9, 1         ; increment
  LDI r14, 76      ; 'L'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 68      ; 'D'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 73      ; 'I'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 114      ; 'r'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 48      ; '0'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 44
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 48      ; '0'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 10
  STORE r0, r14
  ADD r0, r9
  LDI r14, 76      ; 'L'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 68      ; 'D'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 73      ; 'I'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 114      ; 'r'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 44
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 10
  STORE r0, r14
  ADD r0, r9
  LDI r14, 76      ; 'L'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 68      ; 'D'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 73      ; 'I'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 114      ; 'r'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 50      ; '2'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 44
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 50      ; '2'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 53      ; '5'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 54      ; '6'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 10
  STORE r0, r14
  ADD r0, r9
  LDI r14, 108      ; 'l'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 111      ; 'o'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 111      ; 'o'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 112      ; 'p'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 58
  STORE r0, r14
  ADD r0, r9
  LDI r14, 10
  STORE r0, r14
  ADD r0, r9
  LDI r14, 80      ; 'P'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 83      ; 'S'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 69      ; 'E'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 84      ; 'T'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 73      ; 'I'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 114      ; 'r'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 48      ; '0'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 44
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 114      ; 'r'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 48      ; '0'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 44
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 114      ; 'r'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 50      ; '2'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 10
  STORE r0, r14
  ADD r0, r9
  LDI r14, 65      ; 'A'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 68      ; 'D'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 68      ; 'D'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 114      ; 'r'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 48      ; '0'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 44
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 114      ; 'r'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 10
  STORE r0, r14
  ADD r0, r9
  LDI r14, 67      ; 'C'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 77      ; 'M'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 80      ; 'P'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 114      ; 'r'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 48      ; '0'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 44
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 114      ; 'r'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 49      ; '1'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 50      ; '2'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 10
  STORE r0, r14
  ADD r0, r9
  LDI r14, 66      ; 'B'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 76      ; 'L'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 84      ; 'T'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 114      ; 'r'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 48      ; '0'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 44
  STORE r0, r14
  ADD r0, r9
  LDI r14, 32
  STORE r0, r14
  ADD r0, r9
  LDI r14, 108      ; 'l'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 111      ; 'o'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 111      ; 'o'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 112      ; 'p'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 10
  STORE r0, r14
  ADD r0, r9
  LDI r14, 72      ; 'H'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 65      ; 'A'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 76      ; 'L'
  STORE r0, r14
  ADD r0, r9
  LDI r14, 84      ; 'T'
  STORE r0, r14
  ADD r0, r9
  ; Null-terminate
  LDI r14, 0
  STORE r0, r14

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT