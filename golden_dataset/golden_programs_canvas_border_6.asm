; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r7, 0x8000    ; canvas buffer start
  LDI r15, 1         ; increment
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 50      ; '2'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 50      ; '2'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 53      ; '5'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 54      ; '6'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 120      ; 'x'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 70      ; 'F'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 70      ; 'F'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 116      ; 't'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 111      ; 'o'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 112      ; 'p'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 58
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 80      ; 'P'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 83      ; 'S'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 69      ; 'E'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 84      ; 'T'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 65      ; 'A'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 65      ; 'A'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 67      ; 'C'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 77      ; 'M'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 80      ; 'P'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 50      ; '2'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 66      ; 'B'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 84      ; 'T'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 116      ; 't'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 111      ; 'o'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 112      ; 'p'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 120      ; 'x'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 70      ; 'F'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 70      ; 'F'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 98      ; 'b'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 111      ; 'o'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 116      ; 't'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 58
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 80      ; 'P'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 83      ; 'S'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 69      ; 'E'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 84      ; 'T'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 50      ; '2'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 53      ; '5'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 53      ; '5'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 65      ; 'A'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 65      ; 'A'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 67      ; 'C'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 77      ; 'M'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 80      ; 'P'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 50      ; '2'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 66      ; 'B'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 84      ; 'T'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 98      ; 'b'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 111      ; 'o'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 116      ; 't'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 120      ; 'x'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 70      ; 'F'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 70      ; 'F'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 108      ; 'l'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 101      ; 'e'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 102      ; 'f'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 116      ; 't'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 58
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 80      ; 'P'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 83      ; 'S'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 69      ; 'E'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 84      ; 'T'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 65      ; 'A'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 65      ; 'A'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 67      ; 'C'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 77      ; 'M'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 80      ; 'P'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 50      ; '2'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 66      ; 'B'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 84      ; 'T'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 108      ; 'l'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 101      ; 'e'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 102      ; 'f'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 116      ; 't'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 120      ; 'x'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 70      ; 'F'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 70      ; 'F'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 70      ; 'F'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 70      ; 'F'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 105      ; 'i'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 103      ; 'g'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 104      ; 'h'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 116      ; 't'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 58
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 80      ; 'P'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 83      ; 'S'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 69      ; 'E'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 84      ; 'T'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 73      ; 'I'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 50      ; '2'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 53      ; '5'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 53      ; '5'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 65      ; 'A'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 65      ; 'A'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 68      ; 'D'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 51      ; '3'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 67      ; 'C'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 77      ; 'M'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 80      ; 'P'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 49      ; '1'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 50      ; '2'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 66      ; 'B'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 84      ; 'T'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 48      ; '0'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 44
  STORE r7, r11
  ADD r7, r15
  LDI r11, 32
  STORE r7, r11
  ADD r7, r15
  LDI r11, 114      ; 'r'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 105      ; 'i'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 103      ; 'g'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 104      ; 'h'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 116      ; 't'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 10
  STORE r7, r11
  ADD r7, r15
  LDI r11, 72      ; 'H'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 65      ; 'A'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 76      ; 'L'
  STORE r7, r11
  ADD r7, r15
  LDI r11, 84      ; 'T'
  STORE r7, r11
  ADD r7, r15
  ; Null-terminate
  LDI r11, 0
  STORE r7, r11

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT