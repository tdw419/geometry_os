; DESCRIPTION: Geometry OS program to draw a colored object.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r4, 0x8000    ; canvas buffer start
  LDI r11, 1         ; increment
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 50      ; '2'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 50      ; '2'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 53      ; '5'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 54      ; '6'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 120      ; 'x'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 70      ; 'F'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 70      ; 'F'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 116      ; 't'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 111      ; 'o'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 112      ; 'p'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 58
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 80      ; 'P'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 83      ; 'S'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 69      ; 'E'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 84      ; 'T'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 65      ; 'A'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 65      ; 'A'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 67      ; 'C'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 77      ; 'M'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 80      ; 'P'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 50      ; '2'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 66      ; 'B'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 84      ; 'T'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 116      ; 't'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 111      ; 'o'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 112      ; 'p'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 120      ; 'x'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 70      ; 'F'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 70      ; 'F'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 98      ; 'b'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 111      ; 'o'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 116      ; 't'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 58
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 80      ; 'P'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 83      ; 'S'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 69      ; 'E'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 84      ; 'T'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 50      ; '2'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 53      ; '5'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 53      ; '5'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 65      ; 'A'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 65      ; 'A'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 67      ; 'C'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 77      ; 'M'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 80      ; 'P'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 50      ; '2'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 66      ; 'B'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 84      ; 'T'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 98      ; 'b'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 111      ; 'o'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 116      ; 't'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 120      ; 'x'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 70      ; 'F'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 70      ; 'F'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 108      ; 'l'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 101      ; 'e'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 102      ; 'f'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 116      ; 't'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 58
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 80      ; 'P'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 83      ; 'S'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 69      ; 'E'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 84      ; 'T'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 65      ; 'A'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 65      ; 'A'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 67      ; 'C'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 77      ; 'M'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 80      ; 'P'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 50      ; '2'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 66      ; 'B'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 84      ; 'T'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 108      ; 'l'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 101      ; 'e'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 102      ; 'f'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 116      ; 't'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 120      ; 'x'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 70      ; 'F'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 70      ; 'F'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 70      ; 'F'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 70      ; 'F'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 105      ; 'i'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 103      ; 'g'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 104      ; 'h'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 116      ; 't'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 58
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 80      ; 'P'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 83      ; 'S'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 69      ; 'E'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 84      ; 'T'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 73      ; 'I'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 50      ; '2'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 53      ; '5'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 53      ; '5'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 65      ; 'A'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 65      ; 'A'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 68      ; 'D'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 51      ; '3'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 67      ; 'C'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 77      ; 'M'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 80      ; 'P'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 49      ; '1'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 50      ; '2'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 66      ; 'B'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 84      ; 'T'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 48      ; '0'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 44
  STORE r4, r7
  ADD r4, r11
  LDI r7, 32
  STORE r4, r7
  ADD r4, r11
  LDI r7, 114      ; 'r'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 105      ; 'i'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 103      ; 'g'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 104      ; 'h'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 116      ; 't'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 10
  STORE r4, r7
  ADD r4, r11
  LDI r7, 72      ; 'H'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 65      ; 'A'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 76      ; 'L'
  STORE r4, r7
  ADD r4, r11
  LDI r7, 84      ; 'T'
  STORE r4, r7
  ADD r4, r11
  ; Null-terminate
  LDI r7, 0
  STORE r4, r7

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT