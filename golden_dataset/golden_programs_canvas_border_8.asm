; DESCRIPTION: The assembly code writes a series of strings to a buffer starting at address 0x8000, forming a colorful 4-sided border. It then assembles this buffer into executable code and runs it.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r10, 0x8000    ; canvas buffer start
  LDI r11, 1         ; increment
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 53      ; '5'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 54      ; '6'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 120      ; 'x'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 70      ; 'F'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 70      ; 'F'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 116      ; 't'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 111      ; 'o'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 112      ; 'p'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 58
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 80      ; 'P'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 83      ; 'S'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 69      ; 'E'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 65      ; 'A'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 65      ; 'A'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 67      ; 'C'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 77      ; 'M'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 80      ; 'P'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 66      ; 'B'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 116      ; 't'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 111      ; 'o'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 112      ; 'p'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 120      ; 'x'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 70      ; 'F'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 70      ; 'F'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 98      ; 'b'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 111      ; 'o'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 116      ; 't'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 58
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 80      ; 'P'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 83      ; 'S'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 69      ; 'E'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 53      ; '5'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 53      ; '5'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 65      ; 'A'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 65      ; 'A'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 67      ; 'C'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 77      ; 'M'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 80      ; 'P'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 66      ; 'B'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 98      ; 'b'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 111      ; 'o'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 116      ; 't'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 120      ; 'x'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 70      ; 'F'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 70      ; 'F'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 108      ; 'l'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 101      ; 'e'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 102      ; 'f'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 116      ; 't'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 58
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 80      ; 'P'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 83      ; 'S'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 69      ; 'E'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 65      ; 'A'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 65      ; 'A'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 67      ; 'C'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 77      ; 'M'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 80      ; 'P'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 66      ; 'B'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 108      ; 'l'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 101      ; 'e'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 102      ; 'f'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 116      ; 't'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 120      ; 'x'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 70      ; 'F'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 70      ; 'F'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 70      ; 'F'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 70      ; 'F'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 105      ; 'i'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 103      ; 'g'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 104      ; 'h'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 116      ; 't'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 58
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 80      ; 'P'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 83      ; 'S'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 69      ; 'E'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 53      ; '5'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 53      ; '5'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 65      ; 'A'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 65      ; 'A'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 51      ; '3'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 67      ; 'C'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 77      ; 'M'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 80      ; 'P'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 66      ; 'B'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 44
  STORE r10, r2
  ADD r10, r11
  LDI r2, 32
  STORE r10, r2
  ADD r10, r11
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 105      ; 'i'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 103      ; 'g'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 104      ; 'h'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 116      ; 't'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 10
  STORE r10, r2
  ADD r10, r11
  LDI r2, 72      ; 'H'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 65      ; 'A'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r11
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r11
  ; Null-terminate
  LDI r2, 0
  STORE r10, r2

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT