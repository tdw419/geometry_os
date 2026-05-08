; DESCRIPTION: The assembly code writes a series of strings to a buffer starting at address 0x8000, forming a colorful 4-sided border. It then assembles this buffer into executable code and runs it.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r5, 0x8000    ; canvas buffer start
  LDI r12, 1         ; increment
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 50      ; '2'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 50      ; '2'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 53      ; '5'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 54      ; '6'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 120      ; 'x'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 70      ; 'F'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 70      ; 'F'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 116      ; 't'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 111      ; 'o'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 112      ; 'p'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 58
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 80      ; 'P'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 83      ; 'S'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 69      ; 'E'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 84      ; 'T'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 65      ; 'A'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 65      ; 'A'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 67      ; 'C'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 77      ; 'M'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 80      ; 'P'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 50      ; '2'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 66      ; 'B'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 84      ; 'T'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 116      ; 't'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 111      ; 'o'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 112      ; 'p'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 120      ; 'x'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 70      ; 'F'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 70      ; 'F'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 98      ; 'b'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 111      ; 'o'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 116      ; 't'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 58
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 80      ; 'P'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 83      ; 'S'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 69      ; 'E'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 84      ; 'T'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 50      ; '2'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 53      ; '5'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 53      ; '5'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 65      ; 'A'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 65      ; 'A'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 67      ; 'C'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 77      ; 'M'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 80      ; 'P'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 50      ; '2'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 66      ; 'B'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 84      ; 'T'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 98      ; 'b'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 111      ; 'o'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 116      ; 't'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 120      ; 'x'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 70      ; 'F'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 70      ; 'F'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 108      ; 'l'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 101      ; 'e'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 102      ; 'f'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 116      ; 't'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 58
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 80      ; 'P'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 83      ; 'S'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 69      ; 'E'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 84      ; 'T'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 65      ; 'A'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 65      ; 'A'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 67      ; 'C'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 77      ; 'M'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 80      ; 'P'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 50      ; '2'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 66      ; 'B'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 84      ; 'T'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 108      ; 'l'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 101      ; 'e'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 102      ; 'f'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 116      ; 't'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 120      ; 'x'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 70      ; 'F'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 70      ; 'F'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 70      ; 'F'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 70      ; 'F'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 105      ; 'i'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 103      ; 'g'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 104      ; 'h'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 116      ; 't'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 58
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 80      ; 'P'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 83      ; 'S'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 69      ; 'E'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 84      ; 'T'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 73      ; 'I'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 50      ; '2'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 53      ; '5'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 53      ; '5'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 65      ; 'A'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 65      ; 'A'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 68      ; 'D'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 51      ; '3'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 67      ; 'C'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 77      ; 'M'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 80      ; 'P'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 49      ; '1'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 50      ; '2'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 66      ; 'B'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 84      ; 'T'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 48      ; '0'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 44
  STORE r5, r1
  ADD r5, r12
  LDI r1, 32
  STORE r5, r1
  ADD r5, r12
  LDI r1, 114      ; 'r'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 105      ; 'i'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 103      ; 'g'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 104      ; 'h'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 116      ; 't'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 10
  STORE r5, r1
  ADD r5, r12
  LDI r1, 72      ; 'H'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 65      ; 'A'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 76      ; 'L'
  STORE r5, r1
  ADD r5, r12
  LDI r1, 84      ; 'T'
  STORE r5, r1
  ADD r5, r12
  ; Null-terminate
  LDI r1, 0
  STORE r5, r1

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT