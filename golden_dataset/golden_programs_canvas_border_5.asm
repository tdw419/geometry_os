; DESCRIPTION: The assembly code writes a series of strings to a buffer starting at address 0x8000, forming a colorful 4-sided border. It then assembles this buffer into executable code and runs it.

; canvas_border.asm
; Self-modifying demo - writes a colorful 4-sided border to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r13, 0x8000    ; canvas buffer start
  LDI r3, 1         ; increment
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 50      ; '2'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 50      ; '2'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 53      ; '5'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 54      ; '6'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 120      ; 'x'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 70      ; 'F'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 70      ; 'F'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 116      ; 't'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 111      ; 'o'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 112      ; 'p'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 58
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 80      ; 'P'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 83      ; 'S'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 69      ; 'E'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 84      ; 'T'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 65      ; 'A'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 65      ; 'A'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 67      ; 'C'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 77      ; 'M'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 80      ; 'P'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 50      ; '2'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 66      ; 'B'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 84      ; 'T'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 116      ; 't'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 111      ; 'o'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 112      ; 'p'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 120      ; 'x'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 70      ; 'F'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 70      ; 'F'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 98      ; 'b'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 111      ; 'o'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 116      ; 't'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 58
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 80      ; 'P'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 83      ; 'S'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 69      ; 'E'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 84      ; 'T'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 50      ; '2'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 53      ; '5'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 53      ; '5'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 65      ; 'A'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 65      ; 'A'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 67      ; 'C'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 77      ; 'M'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 80      ; 'P'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 50      ; '2'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 66      ; 'B'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 84      ; 'T'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 98      ; 'b'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 111      ; 'o'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 116      ; 't'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 120      ; 'x'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 70      ; 'F'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 70      ; 'F'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 108      ; 'l'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 101      ; 'e'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 102      ; 'f'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 116      ; 't'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 58
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 80      ; 'P'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 83      ; 'S'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 69      ; 'E'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 84      ; 'T'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 65      ; 'A'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 65      ; 'A'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 67      ; 'C'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 77      ; 'M'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 80      ; 'P'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 50      ; '2'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 66      ; 'B'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 84      ; 'T'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 108      ; 'l'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 101      ; 'e'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 102      ; 'f'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 116      ; 't'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 120      ; 'x'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 70      ; 'F'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 70      ; 'F'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 70      ; 'F'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 70      ; 'F'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 105      ; 'i'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 103      ; 'g'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 104      ; 'h'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 116      ; 't'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 58
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 80      ; 'P'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 83      ; 'S'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 69      ; 'E'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 84      ; 'T'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 73      ; 'I'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 50      ; '2'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 53      ; '5'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 53      ; '5'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 65      ; 'A'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 65      ; 'A'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 68      ; 'D'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 51      ; '3'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 67      ; 'C'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 77      ; 'M'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 80      ; 'P'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 49      ; '1'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 50      ; '2'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 66      ; 'B'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 84      ; 'T'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 48      ; '0'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 44
  STORE r13, r4
  ADD r13, r3
  LDI r4, 32
  STORE r13, r4
  ADD r13, r3
  LDI r4, 114      ; 'r'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 105      ; 'i'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 103      ; 'g'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 104      ; 'h'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 116      ; 't'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 10
  STORE r13, r4
  ADD r13, r3
  LDI r4, 72      ; 'H'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 65      ; 'A'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 76      ; 'L'
  STORE r13, r4
  ADD r13, r3
  LDI r4, 84      ; 'T'
  STORE r13, r4
  ADD r13, r3
  ; Null-terminate
  LDI r4, 0
  STORE r13, r4

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT