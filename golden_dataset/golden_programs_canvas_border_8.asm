; DESCRIPTION: A colored object centered at the screen with fixed size.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r5, 0x8000    ; canvas buffer start
  LDI r3, 1         ; increment
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 50      ; '2'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 50      ; '2'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 53      ; '5'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 54      ; '6'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 120      ; 'x'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 70      ; 'F'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 70      ; 'F'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 116      ; 't'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 111      ; 'o'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 112      ; 'p'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 58
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 80      ; 'P'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 83      ; 'S'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 69      ; 'E'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 84      ; 'T'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 65      ; 'A'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 65      ; 'A'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 67      ; 'C'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 77      ; 'M'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 80      ; 'P'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 50      ; '2'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 66      ; 'B'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 84      ; 'T'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 116      ; 't'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 111      ; 'o'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 112      ; 'p'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 120      ; 'x'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 70      ; 'F'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 70      ; 'F'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 98      ; 'b'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 111      ; 'o'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 116      ; 't'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 58
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 80      ; 'P'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 83      ; 'S'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 69      ; 'E'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 84      ; 'T'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 50      ; '2'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 53      ; '5'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 53      ; '5'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 65      ; 'A'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 65      ; 'A'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 67      ; 'C'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 77      ; 'M'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 80      ; 'P'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 50      ; '2'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 66      ; 'B'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 84      ; 'T'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 98      ; 'b'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 111      ; 'o'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 116      ; 't'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 120      ; 'x'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 70      ; 'F'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 70      ; 'F'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 108      ; 'l'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 101      ; 'e'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 102      ; 'f'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 116      ; 't'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 58
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 80      ; 'P'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 83      ; 'S'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 69      ; 'E'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 84      ; 'T'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 65      ; 'A'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 65      ; 'A'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 67      ; 'C'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 77      ; 'M'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 80      ; 'P'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 50      ; '2'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 66      ; 'B'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 84      ; 'T'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 108      ; 'l'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 101      ; 'e'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 102      ; 'f'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 116      ; 't'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 120      ; 'x'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 70      ; 'F'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 70      ; 'F'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 70      ; 'F'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 70      ; 'F'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 105      ; 'i'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 103      ; 'g'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 104      ; 'h'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 116      ; 't'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 58
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 80      ; 'P'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 83      ; 'S'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 69      ; 'E'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 84      ; 'T'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 73      ; 'I'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 50      ; '2'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 53      ; '5'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 53      ; '5'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 65      ; 'A'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 65      ; 'A'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 68      ; 'D'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 51      ; '3'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 67      ; 'C'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 77      ; 'M'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 80      ; 'P'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 49      ; '1'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 50      ; '2'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 66      ; 'B'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 84      ; 'T'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 48      ; '0'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 44
  STORE r5, r13
  ADD r5, r3
  LDI r13, 32
  STORE r5, r13
  ADD r5, r3
  LDI r13, 114      ; 'r'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 105      ; 'i'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 103      ; 'g'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 104      ; 'h'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 116      ; 't'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 10
  STORE r5, r13
  ADD r5, r3
  LDI r13, 72      ; 'H'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 65      ; 'A'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 76      ; 'L'
  STORE r5, r13
  ADD r5, r3
  LDI r13, 84      ; 'T'
  STORE r5, r13
  ADD r5, r3
  ; Null-terminate
  LDI r13, 0
  STORE r5, r13

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT