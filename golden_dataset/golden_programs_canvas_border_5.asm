; DESCRIPTION: Draws a colored object at the screen with fixed size.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r15, 0x8000    ; canvas buffer start
  LDI r6, 1         ; increment
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 53      ; '5'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 54      ; '6'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 120      ; 'x'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 116      ; 't'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 111      ; 'o'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 112      ; 'p'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 58
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 83      ; 'S'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 69      ; 'E'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 67      ; 'C'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 77      ; 'M'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 66      ; 'B'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 116      ; 't'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 111      ; 'o'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 112      ; 'p'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 120      ; 'x'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 98      ; 'b'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 111      ; 'o'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 116      ; 't'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 58
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 83      ; 'S'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 69      ; 'E'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 53      ; '5'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 53      ; '5'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 67      ; 'C'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 77      ; 'M'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 66      ; 'B'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 98      ; 'b'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 111      ; 'o'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 116      ; 't'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 120      ; 'x'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 108      ; 'l'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 101      ; 'e'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 102      ; 'f'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 116      ; 't'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 58
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 83      ; 'S'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 69      ; 'E'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 67      ; 'C'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 77      ; 'M'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 66      ; 'B'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 108      ; 'l'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 101      ; 'e'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 102      ; 'f'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 116      ; 't'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 120      ; 'x'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 105      ; 'i'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 103      ; 'g'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 104      ; 'h'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 116      ; 't'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 58
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 83      ; 'S'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 69      ; 'E'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 53      ; '5'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 53      ; '5'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 67      ; 'C'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 77      ; 'M'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 66      ; 'B'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 44
  STORE r15, r4
  ADD r15, r6
  LDI r4, 32
  STORE r15, r4
  ADD r15, r6
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 105      ; 'i'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 103      ; 'g'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 104      ; 'h'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 116      ; 't'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 10
  STORE r15, r4
  ADD r15, r6
  LDI r4, 72      ; 'H'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r6
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r6
  ; Null-terminate
  LDI r4, 0
  STORE r15, r4

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT