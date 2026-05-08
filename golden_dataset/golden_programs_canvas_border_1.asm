; DESCRIPTION: Display a object using color colored at the screen.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r6, 0x8000    ; canvas buffer start
  LDI r14, 1         ; increment
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 53      ; '5'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 54      ; '6'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 120      ; 'x'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 70      ; 'F'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 70      ; 'F'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 116      ; 't'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 111      ; 'o'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 112      ; 'p'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 58
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 80      ; 'P'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 83      ; 'S'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 69      ; 'E'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 65      ; 'A'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 65      ; 'A'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 67      ; 'C'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 77      ; 'M'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 80      ; 'P'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 66      ; 'B'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 116      ; 't'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 111      ; 'o'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 112      ; 'p'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 120      ; 'x'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 70      ; 'F'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 70      ; 'F'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 98      ; 'b'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 111      ; 'o'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 116      ; 't'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 58
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 80      ; 'P'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 83      ; 'S'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 69      ; 'E'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 53      ; '5'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 53      ; '5'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 65      ; 'A'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 65      ; 'A'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 67      ; 'C'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 77      ; 'M'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 80      ; 'P'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 66      ; 'B'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 98      ; 'b'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 111      ; 'o'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 116      ; 't'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 120      ; 'x'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 70      ; 'F'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 70      ; 'F'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 108      ; 'l'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 101      ; 'e'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 102      ; 'f'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 116      ; 't'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 58
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 80      ; 'P'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 83      ; 'S'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 69      ; 'E'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 65      ; 'A'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 65      ; 'A'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 67      ; 'C'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 77      ; 'M'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 80      ; 'P'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 66      ; 'B'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 108      ; 'l'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 101      ; 'e'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 102      ; 'f'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 116      ; 't'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 120      ; 'x'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 70      ; 'F'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 70      ; 'F'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 70      ; 'F'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 70      ; 'F'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 105      ; 'i'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 103      ; 'g'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 104      ; 'h'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 116      ; 't'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 58
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 80      ; 'P'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 83      ; 'S'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 69      ; 'E'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 53      ; '5'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 53      ; '5'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 65      ; 'A'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 65      ; 'A'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 51      ; '3'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 67      ; 'C'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 77      ; 'M'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 80      ; 'P'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 66      ; 'B'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 44
  STORE r6, r10
  ADD r6, r14
  LDI r10, 32
  STORE r6, r10
  ADD r6, r14
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 105      ; 'i'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 103      ; 'g'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 104      ; 'h'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 116      ; 't'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 10
  STORE r6, r10
  ADD r6, r14
  LDI r10, 72      ; 'H'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 65      ; 'A'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r14
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r14
  ; Null-terminate
  LDI r10, 0
  STORE r6, r10

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT