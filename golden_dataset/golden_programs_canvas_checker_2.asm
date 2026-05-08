; DESCRIPTION: This GeOS assembly code writes a checkerboard pattern to a canvas buffer starting at address 0x8000. It then assembles the written text into machine code and executes it using `ASMSELF` and `RUNNEXT`. The pattern consists of repeated sequences of characters forming lines with coordinates and labels, followed by additional commands and parameters.

; canvas_checker.asm
; Self-modifying demo - writes a checkerboard pattern to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r14, 0x8000    ; canvas buffer start
  LDI r3, 1         ; increment
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 73      ; 'I'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 73      ; 'I'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 73      ; 'I'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 50      ; '2'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 56      ; '8'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 73      ; 'I'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 51      ; '3'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 54      ; '6'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 73      ; 'I'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 52      ; '4'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 120      ; 'x'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 70      ; 'F'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 70      ; 'F'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 73      ; 'I'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 53      ; '5'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 120      ; 'x'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 70      ; 'F'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 70      ; 'F'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 111      ; 'o'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 119      ; 'w'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 58
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 73      ; 'I'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 50      ; '2'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 99      ; 'c'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 111      ; 'o'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 108      ; 'l'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 58
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 77      ; 'M'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 79      ; 'O'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 86      ; 'V'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 50      ; '2'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 88      ; 'X'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 79      ; 'O'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 82      ; 'R'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 50      ; '2'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 50      ; '2'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 65      ; 'A'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 78      ; 'N'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 50      ; '2'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 50      ; '2'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 74      ; 'J'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 90      ; 'Z'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 50      ; '2'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 117      ; 'u'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 115      ; 's'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 101      ; 'e'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 95
  STORE r14, r13
  ADD r14, r3
  LDI r13, 97      ; 'a'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 73      ; 'I'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 54      ; '6'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 65      ; 'A'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 54      ; '6'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 53      ; '5'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 74      ; 'J'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 77      ; 'M'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 80      ; 'P'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 100      ; 'd'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 97      ; 'a'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 119      ; 'w'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 117      ; 'u'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 115      ; 's'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 101      ; 'e'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 95
  STORE r14, r13
  ADD r14, r3
  LDI r13, 97      ; 'a'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 58
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 73      ; 'I'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 54      ; '6'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 65      ; 'A'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 54      ; '6'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 52      ; '4'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 100      ; 'd'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 97      ; 'a'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 119      ; 'w'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 58
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 80      ; 'P'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 83      ; 'S'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 69      ; 'E'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 84      ; 'T'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 73      ; 'I'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 50      ; '2'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 54      ; '6'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 65      ; 'A'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 50      ; '2'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 67      ; 'C'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 77      ; 'M'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 80      ; 'P'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 50      ; '2'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 51      ; '3'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 66      ; 'B'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 84      ; 'T'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 99      ; 'c'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 111      ; 'o'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 108      ; 'l'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 65      ; 'A'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 68      ; 'D'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 67      ; 'C'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 77      ; 'M'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 80      ; 'P'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 49      ; '1'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 51      ; '3'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 66      ; 'B'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 84      ; 'T'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 48      ; '0'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 44
  STORE r14, r13
  ADD r14, r3
  LDI r13, 32
  STORE r14, r13
  ADD r14, r3
  LDI r13, 114      ; 'r'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 111      ; 'o'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 119      ; 'w'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 10
  STORE r14, r13
  ADD r14, r3
  LDI r13, 72      ; 'H'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 65      ; 'A'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 76      ; 'L'
  STORE r14, r13
  ADD r14, r3
  LDI r13, 84      ; 'T'
  STORE r14, r13
  ADD r14, r3
  ; Null-terminate
  LDI r13, 0
  STORE r14, r13

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT