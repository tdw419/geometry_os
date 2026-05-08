; DESCRIPTION: Geometry OS program to draw a colored object.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r3, 0x8000    ; canvas buffer start
  LDI r13, 1         ; increment
  LDI r1, 76      ; 'L'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 68      ; 'D'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 73      ; 'I'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 114      ; 'r'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 48      ; '0'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 44
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 48      ; '0'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 10
  STORE r3, r1
  ADD r3, r13
  LDI r1, 76      ; 'L'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 68      ; 'D'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 73      ; 'I'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 114      ; 'r'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 44
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 10
  STORE r3, r1
  ADD r3, r13
  LDI r1, 76      ; 'L'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 68      ; 'D'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 73      ; 'I'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 114      ; 'r'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 50      ; '2'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 44
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 50      ; '2'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 53      ; '5'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 54      ; '6'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 10
  STORE r3, r1
  ADD r3, r13
  LDI r1, 108      ; 'l'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 111      ; 'o'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 111      ; 'o'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 112      ; 'p'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 58
  STORE r3, r1
  ADD r3, r13
  LDI r1, 10
  STORE r3, r1
  ADD r3, r13
  LDI r1, 80      ; 'P'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 83      ; 'S'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 69      ; 'E'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 84      ; 'T'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 73      ; 'I'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 114      ; 'r'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 48      ; '0'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 44
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 114      ; 'r'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 48      ; '0'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 44
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 114      ; 'r'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 50      ; '2'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 10
  STORE r3, r1
  ADD r3, r13
  LDI r1, 65      ; 'A'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 68      ; 'D'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 68      ; 'D'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 114      ; 'r'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 48      ; '0'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 44
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 114      ; 'r'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 10
  STORE r3, r1
  ADD r3, r13
  LDI r1, 67      ; 'C'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 77      ; 'M'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 80      ; 'P'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 114      ; 'r'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 48      ; '0'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 44
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 114      ; 'r'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 49      ; '1'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 50      ; '2'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 10
  STORE r3, r1
  ADD r3, r13
  LDI r1, 66      ; 'B'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 76      ; 'L'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 84      ; 'T'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 114      ; 'r'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 48      ; '0'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 44
  STORE r3, r1
  ADD r3, r13
  LDI r1, 32
  STORE r3, r1
  ADD r3, r13
  LDI r1, 108      ; 'l'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 111      ; 'o'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 111      ; 'o'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 112      ; 'p'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 10
  STORE r3, r1
  ADD r3, r13
  LDI r1, 72      ; 'H'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 65      ; 'A'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 76      ; 'L'
  STORE r3, r1
  ADD r3, r13
  LDI r1, 84      ; 'T'
  STORE r3, r1
  ADD r3, r13
  ; Null-terminate
  LDI r1, 0
  STORE r3, r1

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT