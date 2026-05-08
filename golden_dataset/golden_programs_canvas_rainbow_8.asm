; DESCRIPTION: A colored object centered at the screen with fixed size.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r9, 0x8000    ; canvas buffer start
  LDI r6, 1         ; increment
  LDI r8, 76      ; 'L'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 68      ; 'D'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 73      ; 'I'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 114      ; 'r'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 48      ; '0'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 44
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 48      ; '0'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 10
  STORE r9, r8
  ADD r9, r6
  LDI r8, 76      ; 'L'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 68      ; 'D'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 73      ; 'I'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 114      ; 'r'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 44
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 10
  STORE r9, r8
  ADD r9, r6
  LDI r8, 76      ; 'L'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 68      ; 'D'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 73      ; 'I'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 114      ; 'r'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 50      ; '2'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 44
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 50      ; '2'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 53      ; '5'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 54      ; '6'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 10
  STORE r9, r8
  ADD r9, r6
  LDI r8, 108      ; 'l'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 111      ; 'o'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 111      ; 'o'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 112      ; 'p'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 58
  STORE r9, r8
  ADD r9, r6
  LDI r8, 10
  STORE r9, r8
  ADD r9, r6
  LDI r8, 80      ; 'P'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 83      ; 'S'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 69      ; 'E'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 84      ; 'T'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 73      ; 'I'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 114      ; 'r'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 48      ; '0'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 44
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 114      ; 'r'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 48      ; '0'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 44
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 114      ; 'r'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 50      ; '2'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 10
  STORE r9, r8
  ADD r9, r6
  LDI r8, 65      ; 'A'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 68      ; 'D'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 68      ; 'D'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 114      ; 'r'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 48      ; '0'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 44
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 114      ; 'r'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 10
  STORE r9, r8
  ADD r9, r6
  LDI r8, 67      ; 'C'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 77      ; 'M'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 80      ; 'P'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 114      ; 'r'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 48      ; '0'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 44
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 114      ; 'r'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 49      ; '1'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 50      ; '2'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 10
  STORE r9, r8
  ADD r9, r6
  LDI r8, 66      ; 'B'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 76      ; 'L'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 84      ; 'T'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 114      ; 'r'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 48      ; '0'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 44
  STORE r9, r8
  ADD r9, r6
  LDI r8, 32
  STORE r9, r8
  ADD r9, r6
  LDI r8, 108      ; 'l'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 111      ; 'o'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 111      ; 'o'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 112      ; 'p'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 10
  STORE r9, r8
  ADD r9, r6
  LDI r8, 72      ; 'H'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 65      ; 'A'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 76      ; 'L'
  STORE r9, r8
  ADD r9, r6
  LDI r8, 84      ; 'T'
  STORE r9, r8
  ADD r9, r6
  ; Null-terminate
  LDI r8, 0
  STORE r9, r8

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT