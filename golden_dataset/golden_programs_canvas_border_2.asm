; DESCRIPTION: The assembly code writes a series of strings to a buffer starting at address 0x8000, forming a colorful 4-sided border. It then assembles this buffer into executable code and runs it.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r14, 0x8000    ; canvas buffer start
  LDI r12, 1         ; increment
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 50      ; '2'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 50      ; '2'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 53      ; '5'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 54      ; '6'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 120      ; 'x'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 70      ; 'F'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 70      ; 'F'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 116      ; 't'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 111      ; 'o'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 112      ; 'p'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 58
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 80      ; 'P'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 83      ; 'S'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 69      ; 'E'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 84      ; 'T'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 65      ; 'A'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 65      ; 'A'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 67      ; 'C'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 77      ; 'M'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 80      ; 'P'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 50      ; '2'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 66      ; 'B'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 84      ; 'T'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 116      ; 't'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 111      ; 'o'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 112      ; 'p'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 120      ; 'x'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 70      ; 'F'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 70      ; 'F'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 98      ; 'b'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 111      ; 'o'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 116      ; 't'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 58
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 80      ; 'P'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 83      ; 'S'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 69      ; 'E'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 84      ; 'T'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 50      ; '2'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 53      ; '5'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 53      ; '5'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 65      ; 'A'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 65      ; 'A'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 67      ; 'C'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 77      ; 'M'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 80      ; 'P'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 50      ; '2'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 66      ; 'B'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 84      ; 'T'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 98      ; 'b'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 111      ; 'o'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 116      ; 't'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 120      ; 'x'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 70      ; 'F'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 70      ; 'F'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 108      ; 'l'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 101      ; 'e'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 102      ; 'f'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 116      ; 't'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 58
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 80      ; 'P'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 83      ; 'S'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 69      ; 'E'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 84      ; 'T'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 65      ; 'A'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 65      ; 'A'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 67      ; 'C'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 77      ; 'M'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 80      ; 'P'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 50      ; '2'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 66      ; 'B'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 84      ; 'T'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 108      ; 'l'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 101      ; 'e'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 102      ; 'f'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 116      ; 't'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 120      ; 'x'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 70      ; 'F'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 70      ; 'F'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 70      ; 'F'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 70      ; 'F'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 105      ; 'i'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 103      ; 'g'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 104      ; 'h'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 116      ; 't'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 58
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 80      ; 'P'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 83      ; 'S'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 69      ; 'E'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 84      ; 'T'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 73      ; 'I'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 50      ; '2'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 53      ; '5'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 53      ; '5'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 65      ; 'A'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 65      ; 'A'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 68      ; 'D'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 51      ; '3'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 67      ; 'C'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 77      ; 'M'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 80      ; 'P'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 49      ; '1'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 50      ; '2'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 66      ; 'B'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 84      ; 'T'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 48      ; '0'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 44
  STORE r14, r8
  ADD r14, r12
  LDI r8, 32
  STORE r14, r8
  ADD r14, r12
  LDI r8, 114      ; 'r'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 105      ; 'i'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 103      ; 'g'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 104      ; 'h'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 116      ; 't'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 10
  STORE r14, r8
  ADD r14, r12
  LDI r8, 72      ; 'H'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 65      ; 'A'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 76      ; 'L'
  STORE r14, r8
  ADD r14, r12
  LDI r8, 84      ; 'T'
  STORE r14, r8
  ADD r14, r12
  ; Null-terminate
  LDI r8, 0
  STORE r14, r8

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT