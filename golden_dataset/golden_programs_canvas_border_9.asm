; DESCRIPTION: The assembly code writes a series of strings to a buffer starting at address 0x8000, forming a colorful 4-sided border. It then assembles this buffer into executable code and runs it.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r1, 0x8000    ; canvas buffer start
  LDI r3, 1         ; increment
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 50      ; '2'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 50      ; '2'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 53      ; '5'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 54      ; '6'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 120      ; 'x'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 70      ; 'F'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 70      ; 'F'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 116      ; 't'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 111      ; 'o'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 112      ; 'p'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 58
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 80      ; 'P'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 83      ; 'S'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 69      ; 'E'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 84      ; 'T'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 65      ; 'A'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 65      ; 'A'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 67      ; 'C'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 77      ; 'M'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 80      ; 'P'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 50      ; '2'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 66      ; 'B'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 84      ; 'T'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 116      ; 't'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 111      ; 'o'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 112      ; 'p'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 120      ; 'x'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 70      ; 'F'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 70      ; 'F'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 98      ; 'b'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 111      ; 'o'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 116      ; 't'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 58
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 80      ; 'P'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 83      ; 'S'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 69      ; 'E'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 84      ; 'T'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 50      ; '2'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 53      ; '5'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 53      ; '5'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 65      ; 'A'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 65      ; 'A'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 67      ; 'C'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 77      ; 'M'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 80      ; 'P'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 50      ; '2'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 66      ; 'B'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 84      ; 'T'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 98      ; 'b'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 111      ; 'o'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 116      ; 't'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 120      ; 'x'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 70      ; 'F'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 70      ; 'F'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 108      ; 'l'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 101      ; 'e'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 102      ; 'f'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 116      ; 't'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 58
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 80      ; 'P'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 83      ; 'S'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 69      ; 'E'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 84      ; 'T'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 65      ; 'A'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 65      ; 'A'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 67      ; 'C'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 77      ; 'M'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 80      ; 'P'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 50      ; '2'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 66      ; 'B'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 84      ; 'T'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 108      ; 'l'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 101      ; 'e'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 102      ; 'f'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 116      ; 't'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 120      ; 'x'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 70      ; 'F'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 70      ; 'F'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 70      ; 'F'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 70      ; 'F'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 105      ; 'i'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 103      ; 'g'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 104      ; 'h'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 116      ; 't'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 58
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 80      ; 'P'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 83      ; 'S'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 69      ; 'E'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 84      ; 'T'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 73      ; 'I'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 50      ; '2'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 53      ; '5'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 53      ; '5'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 65      ; 'A'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 65      ; 'A'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 68      ; 'D'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 51      ; '3'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 67      ; 'C'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 77      ; 'M'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 80      ; 'P'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 49      ; '1'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 50      ; '2'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 66      ; 'B'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 84      ; 'T'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 48      ; '0'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 44
  STORE r1, r6
  ADD r1, r3
  LDI r6, 32
  STORE r1, r6
  ADD r1, r3
  LDI r6, 114      ; 'r'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 105      ; 'i'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 103      ; 'g'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 104      ; 'h'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 116      ; 't'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 10
  STORE r1, r6
  ADD r1, r3
  LDI r6, 72      ; 'H'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 65      ; 'A'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 76      ; 'L'
  STORE r1, r6
  ADD r1, r3
  LDI r6, 84      ; 'T'
  STORE r1, r6
  ADD r1, r3
  ; Null-terminate
  LDI r6, 0
  STORE r1, r6

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT