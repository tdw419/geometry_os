; DESCRIPTION: The assembly code writes a series of strings to a buffer starting at address 0x8000, forming a colorful 4-sided border. It then assembles this buffer into executable code and runs it.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r12, 0x8000    ; canvas buffer start
  LDI r10, 1         ; increment
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 50      ; '2'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 50      ; '2'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 53      ; '5'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 54      ; '6'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 120      ; 'x'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 70      ; 'F'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 70      ; 'F'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 116      ; 't'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 111      ; 'o'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 112      ; 'p'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 58
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 80      ; 'P'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 83      ; 'S'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 69      ; 'E'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 84      ; 'T'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 65      ; 'A'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 65      ; 'A'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 67      ; 'C'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 77      ; 'M'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 80      ; 'P'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 50      ; '2'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 66      ; 'B'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 84      ; 'T'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 116      ; 't'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 111      ; 'o'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 112      ; 'p'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 120      ; 'x'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 70      ; 'F'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 70      ; 'F'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 98      ; 'b'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 111      ; 'o'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 116      ; 't'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 58
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 80      ; 'P'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 83      ; 'S'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 69      ; 'E'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 84      ; 'T'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 50      ; '2'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 53      ; '5'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 53      ; '5'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 65      ; 'A'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 65      ; 'A'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 67      ; 'C'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 77      ; 'M'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 80      ; 'P'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 50      ; '2'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 66      ; 'B'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 84      ; 'T'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 98      ; 'b'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 111      ; 'o'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 116      ; 't'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 120      ; 'x'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 70      ; 'F'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 70      ; 'F'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 108      ; 'l'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 101      ; 'e'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 102      ; 'f'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 116      ; 't'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 58
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 80      ; 'P'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 83      ; 'S'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 69      ; 'E'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 84      ; 'T'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 65      ; 'A'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 65      ; 'A'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 67      ; 'C'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 77      ; 'M'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 80      ; 'P'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 50      ; '2'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 66      ; 'B'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 84      ; 'T'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 108      ; 'l'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 101      ; 'e'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 102      ; 'f'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 116      ; 't'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 120      ; 'x'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 70      ; 'F'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 70      ; 'F'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 70      ; 'F'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 70      ; 'F'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 105      ; 'i'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 103      ; 'g'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 104      ; 'h'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 116      ; 't'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 58
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 80      ; 'P'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 83      ; 'S'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 69      ; 'E'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 84      ; 'T'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 73      ; 'I'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 50      ; '2'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 53      ; '5'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 53      ; '5'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 65      ; 'A'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 65      ; 'A'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 68      ; 'D'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 51      ; '3'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 67      ; 'C'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 77      ; 'M'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 80      ; 'P'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 49      ; '1'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 50      ; '2'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 66      ; 'B'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 84      ; 'T'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 48      ; '0'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 44
  STORE r12, r14
  ADD r12, r10
  LDI r14, 32
  STORE r12, r14
  ADD r12, r10
  LDI r14, 114      ; 'r'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 105      ; 'i'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 103      ; 'g'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 104      ; 'h'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 116      ; 't'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 10
  STORE r12, r14
  ADD r12, r10
  LDI r14, 72      ; 'H'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 65      ; 'A'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 76      ; 'L'
  STORE r12, r14
  ADD r12, r10
  LDI r14, 84      ; 'T'
  STORE r12, r14
  ADD r12, r10
  ; Null-terminate
  LDI r14, 0
  STORE r12, r14

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT