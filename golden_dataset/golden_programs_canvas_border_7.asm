; DESCRIPTION: The assembly code writes a series of strings to a buffer starting at address 0x8000, forming a colorful 4-sided border. It then assembles this buffer into executable code and runs it.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r3, 0x8000    ; canvas buffer start
  LDI r7, 1         ; increment
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 50      ; '2'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 50      ; '2'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 53      ; '5'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 54      ; '6'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 120      ; 'x'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 70      ; 'F'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 70      ; 'F'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 116      ; 't'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 111      ; 'o'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 112      ; 'p'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 58
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 80      ; 'P'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 83      ; 'S'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 69      ; 'E'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 84      ; 'T'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 65      ; 'A'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 65      ; 'A'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 67      ; 'C'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 77      ; 'M'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 80      ; 'P'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 50      ; '2'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 66      ; 'B'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 84      ; 'T'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 116      ; 't'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 111      ; 'o'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 112      ; 'p'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 120      ; 'x'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 70      ; 'F'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 70      ; 'F'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 98      ; 'b'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 111      ; 'o'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 116      ; 't'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 58
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 80      ; 'P'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 83      ; 'S'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 69      ; 'E'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 84      ; 'T'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 50      ; '2'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 53      ; '5'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 53      ; '5'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 65      ; 'A'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 65      ; 'A'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 67      ; 'C'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 77      ; 'M'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 80      ; 'P'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 50      ; '2'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 66      ; 'B'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 84      ; 'T'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 98      ; 'b'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 111      ; 'o'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 116      ; 't'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 120      ; 'x'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 70      ; 'F'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 70      ; 'F'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 108      ; 'l'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 101      ; 'e'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 102      ; 'f'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 116      ; 't'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 58
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 80      ; 'P'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 83      ; 'S'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 69      ; 'E'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 84      ; 'T'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 65      ; 'A'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 65      ; 'A'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 67      ; 'C'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 77      ; 'M'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 80      ; 'P'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 50      ; '2'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 66      ; 'B'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 84      ; 'T'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 108      ; 'l'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 101      ; 'e'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 102      ; 'f'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 116      ; 't'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 120      ; 'x'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 70      ; 'F'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 70      ; 'F'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 70      ; 'F'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 70      ; 'F'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 105      ; 'i'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 103      ; 'g'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 104      ; 'h'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 116      ; 't'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 58
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 80      ; 'P'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 83      ; 'S'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 69      ; 'E'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 84      ; 'T'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 73      ; 'I'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 50      ; '2'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 53      ; '5'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 53      ; '5'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 65      ; 'A'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 65      ; 'A'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 68      ; 'D'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 51      ; '3'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 67      ; 'C'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 77      ; 'M'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 80      ; 'P'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 49      ; '1'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 50      ; '2'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 66      ; 'B'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 84      ; 'T'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 48      ; '0'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 44
  STORE r3, r13
  ADD r3, r7
  LDI r13, 32
  STORE r3, r13
  ADD r3, r7
  LDI r13, 114      ; 'r'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 105      ; 'i'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 103      ; 'g'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 104      ; 'h'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 116      ; 't'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 10
  STORE r3, r13
  ADD r3, r7
  LDI r13, 72      ; 'H'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 65      ; 'A'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 76      ; 'L'
  STORE r3, r13
  ADD r3, r7
  LDI r13, 84      ; 'T'
  STORE r3, r13
  ADD r3, r7
  ; Null-terminate
  LDI r13, 0
  STORE r3, r13

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT