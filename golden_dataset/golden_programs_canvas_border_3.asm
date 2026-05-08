; DESCRIPTION: Draws a colored object at the screen with fixed size.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r10, 0x8000    ; canvas buffer start
  LDI r13, 1         ; increment
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 50      ; '2'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 50      ; '2'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 53      ; '5'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 54      ; '6'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 120      ; 'x'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 70      ; 'F'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 70      ; 'F'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 116      ; 't'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 111      ; 'o'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 112      ; 'p'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 58
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 80      ; 'P'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 83      ; 'S'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 69      ; 'E'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 84      ; 'T'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 65      ; 'A'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 65      ; 'A'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 67      ; 'C'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 77      ; 'M'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 80      ; 'P'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 50      ; '2'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 66      ; 'B'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 84      ; 'T'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 116      ; 't'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 111      ; 'o'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 112      ; 'p'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 120      ; 'x'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 70      ; 'F'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 70      ; 'F'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 98      ; 'b'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 111      ; 'o'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 116      ; 't'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 58
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 80      ; 'P'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 83      ; 'S'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 69      ; 'E'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 84      ; 'T'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 50      ; '2'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 53      ; '5'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 53      ; '5'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 65      ; 'A'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 65      ; 'A'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 67      ; 'C'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 77      ; 'M'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 80      ; 'P'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 50      ; '2'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 66      ; 'B'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 84      ; 'T'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 98      ; 'b'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 111      ; 'o'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 116      ; 't'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 120      ; 'x'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 70      ; 'F'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 70      ; 'F'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 108      ; 'l'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 101      ; 'e'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 102      ; 'f'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 116      ; 't'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 58
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 80      ; 'P'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 83      ; 'S'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 69      ; 'E'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 84      ; 'T'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 65      ; 'A'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 65      ; 'A'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 67      ; 'C'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 77      ; 'M'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 80      ; 'P'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 50      ; '2'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 66      ; 'B'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 84      ; 'T'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 108      ; 'l'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 101      ; 'e'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 102      ; 'f'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 116      ; 't'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 120      ; 'x'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 70      ; 'F'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 70      ; 'F'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 70      ; 'F'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 70      ; 'F'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 105      ; 'i'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 103      ; 'g'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 104      ; 'h'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 116      ; 't'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 58
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 80      ; 'P'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 83      ; 'S'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 69      ; 'E'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 84      ; 'T'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 73      ; 'I'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 50      ; '2'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 53      ; '5'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 53      ; '5'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 65      ; 'A'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 65      ; 'A'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 68      ; 'D'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 51      ; '3'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 67      ; 'C'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 77      ; 'M'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 80      ; 'P'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 49      ; '1'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 50      ; '2'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 66      ; 'B'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 84      ; 'T'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 48      ; '0'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 44
  STORE r10, r12
  ADD r10, r13
  LDI r12, 32
  STORE r10, r12
  ADD r10, r13
  LDI r12, 114      ; 'r'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 105      ; 'i'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 103      ; 'g'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 104      ; 'h'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 116      ; 't'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 10
  STORE r10, r12
  ADD r10, r13
  LDI r12, 72      ; 'H'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 65      ; 'A'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 76      ; 'L'
  STORE r10, r12
  ADD r10, r13
  LDI r12, 84      ; 'T'
  STORE r10, r12
  ADD r10, r13
  ; Null-terminate
  LDI r12, 0
  STORE r10, r12

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT