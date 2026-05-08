; DESCRIPTION: Render a colored object at the screen.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r6, 0x8000    ; canvas buffer start
  LDI r3, 1         ; increment
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 50      ; '2'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 50      ; '2'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 53      ; '5'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 54      ; '6'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 120      ; 'x'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 70      ; 'F'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 70      ; 'F'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 116      ; 't'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 111      ; 'o'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 112      ; 'p'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 58
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 80      ; 'P'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 83      ; 'S'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 69      ; 'E'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 84      ; 'T'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 65      ; 'A'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 65      ; 'A'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 67      ; 'C'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 77      ; 'M'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 80      ; 'P'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 50      ; '2'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 66      ; 'B'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 84      ; 'T'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 116      ; 't'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 111      ; 'o'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 112      ; 'p'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 120      ; 'x'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 70      ; 'F'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 70      ; 'F'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 98      ; 'b'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 111      ; 'o'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 116      ; 't'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 58
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 80      ; 'P'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 83      ; 'S'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 69      ; 'E'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 84      ; 'T'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 50      ; '2'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 53      ; '5'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 53      ; '5'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 65      ; 'A'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 65      ; 'A'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 67      ; 'C'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 77      ; 'M'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 80      ; 'P'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 50      ; '2'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 66      ; 'B'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 84      ; 'T'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 98      ; 'b'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 111      ; 'o'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 116      ; 't'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 120      ; 'x'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 70      ; 'F'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 70      ; 'F'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 108      ; 'l'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 101      ; 'e'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 102      ; 'f'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 116      ; 't'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 58
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 80      ; 'P'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 83      ; 'S'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 69      ; 'E'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 84      ; 'T'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 65      ; 'A'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 65      ; 'A'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 67      ; 'C'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 77      ; 'M'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 80      ; 'P'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 50      ; '2'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 66      ; 'B'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 84      ; 'T'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 108      ; 'l'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 101      ; 'e'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 102      ; 'f'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 116      ; 't'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 120      ; 'x'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 70      ; 'F'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 70      ; 'F'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 70      ; 'F'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 70      ; 'F'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 105      ; 'i'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 103      ; 'g'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 104      ; 'h'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 116      ; 't'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 58
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 80      ; 'P'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 83      ; 'S'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 69      ; 'E'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 84      ; 'T'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 73      ; 'I'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 50      ; '2'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 53      ; '5'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 53      ; '5'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 65      ; 'A'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 65      ; 'A'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 68      ; 'D'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 51      ; '3'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 67      ; 'C'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 77      ; 'M'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 80      ; 'P'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 49      ; '1'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 50      ; '2'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 66      ; 'B'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 84      ; 'T'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 48      ; '0'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 44
  STORE r6, r15
  ADD r6, r3
  LDI r15, 32
  STORE r6, r15
  ADD r6, r3
  LDI r15, 114      ; 'r'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 105      ; 'i'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 103      ; 'g'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 104      ; 'h'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 116      ; 't'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 10
  STORE r6, r15
  ADD r6, r3
  LDI r15, 72      ; 'H'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 65      ; 'A'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 76      ; 'L'
  STORE r6, r15
  ADD r6, r3
  LDI r15, 84      ; 'T'
  STORE r6, r15
  ADD r6, r3
  ; Null-terminate
  LDI r15, 0
  STORE r6, r15

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT