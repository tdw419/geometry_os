; DESCRIPTION: The assembly code writes a series of strings to a buffer starting at address 0x8000, forming a colorful 4-sided border. It then assembles this buffer into executable code and runs it.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r12, 0x8000    ; canvas buffer start
  LDI r2, 1         ; increment
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 50      ; '2'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 50      ; '2'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 53      ; '5'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 54      ; '6'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 120      ; 'x'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 70      ; 'F'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 70      ; 'F'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 116      ; 't'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 111      ; 'o'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 112      ; 'p'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 58
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 80      ; 'P'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 83      ; 'S'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 69      ; 'E'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 84      ; 'T'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 65      ; 'A'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 65      ; 'A'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 67      ; 'C'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 77      ; 'M'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 80      ; 'P'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 50      ; '2'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 66      ; 'B'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 84      ; 'T'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 116      ; 't'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 111      ; 'o'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 112      ; 'p'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 120      ; 'x'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 70      ; 'F'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 70      ; 'F'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 98      ; 'b'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 111      ; 'o'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 116      ; 't'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 58
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 80      ; 'P'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 83      ; 'S'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 69      ; 'E'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 84      ; 'T'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 50      ; '2'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 53      ; '5'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 53      ; '5'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 65      ; 'A'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 65      ; 'A'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 67      ; 'C'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 77      ; 'M'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 80      ; 'P'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 50      ; '2'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 66      ; 'B'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 84      ; 'T'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 98      ; 'b'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 111      ; 'o'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 116      ; 't'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 120      ; 'x'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 70      ; 'F'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 70      ; 'F'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 108      ; 'l'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 101      ; 'e'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 102      ; 'f'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 116      ; 't'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 58
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 80      ; 'P'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 83      ; 'S'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 69      ; 'E'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 84      ; 'T'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 65      ; 'A'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 65      ; 'A'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 67      ; 'C'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 77      ; 'M'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 80      ; 'P'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 50      ; '2'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 66      ; 'B'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 84      ; 'T'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 108      ; 'l'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 101      ; 'e'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 102      ; 'f'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 116      ; 't'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 120      ; 'x'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 70      ; 'F'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 70      ; 'F'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 70      ; 'F'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 70      ; 'F'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 105      ; 'i'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 103      ; 'g'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 104      ; 'h'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 116      ; 't'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 58
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 80      ; 'P'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 83      ; 'S'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 69      ; 'E'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 84      ; 'T'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 73      ; 'I'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 50      ; '2'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 53      ; '5'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 53      ; '5'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 65      ; 'A'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 65      ; 'A'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 68      ; 'D'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 51      ; '3'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 67      ; 'C'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 77      ; 'M'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 80      ; 'P'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 49      ; '1'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 50      ; '2'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 66      ; 'B'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 84      ; 'T'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 48      ; '0'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 44
  STORE r12, r3
  ADD r12, r2
  LDI r3, 32
  STORE r12, r3
  ADD r12, r2
  LDI r3, 114      ; 'r'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 105      ; 'i'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 103      ; 'g'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 104      ; 'h'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 116      ; 't'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 10
  STORE r12, r3
  ADD r12, r2
  LDI r3, 72      ; 'H'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 65      ; 'A'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 76      ; 'L'
  STORE r12, r3
  ADD r12, r2
  LDI r3, 84      ; 'T'
  STORE r12, r3
  ADD r12, r2
  ; Null-terminate
  LDI r3, 0
  STORE r12, r3

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT