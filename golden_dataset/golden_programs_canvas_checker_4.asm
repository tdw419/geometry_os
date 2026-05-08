; DESCRIPTION: This GeOS assembly code writes a checkerboard pattern to a canvas buffer starting at address 0x8000. It then assembles the written text into machine code and executes it using `ASMSELF` and `RUNNEXT`. The pattern consists of repeated sequences of characters forming lines with coordinates and labels, followed by additional commands and parameters.

; canvas_checker.asm
; Self-modifying demo - writes a checkerboard pattern to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r13, 0x8000    ; canvas buffer start
  LDI r2, 1         ; increment
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 73      ; 'I'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 73      ; 'I'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 73      ; 'I'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 50      ; '2'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 56      ; '8'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 73      ; 'I'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 51      ; '3'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 54      ; '6'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 73      ; 'I'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 52      ; '4'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 120      ; 'x'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 70      ; 'F'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 70      ; 'F'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 73      ; 'I'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 53      ; '5'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 120      ; 'x'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 70      ; 'F'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 70      ; 'F'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 111      ; 'o'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 119      ; 'w'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 58
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 73      ; 'I'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 50      ; '2'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 99      ; 'c'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 111      ; 'o'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 108      ; 'l'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 58
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 77      ; 'M'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 79      ; 'O'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 86      ; 'V'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 50      ; '2'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 88      ; 'X'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 79      ; 'O'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 82      ; 'R'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 50      ; '2'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 50      ; '2'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 65      ; 'A'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 78      ; 'N'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 50      ; '2'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 50      ; '2'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 74      ; 'J'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 90      ; 'Z'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 50      ; '2'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 117      ; 'u'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 115      ; 's'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 101      ; 'e'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 95
  STORE r13, r8
  ADD r13, r2
  LDI r8, 97      ; 'a'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 73      ; 'I'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 54      ; '6'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 65      ; 'A'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 54      ; '6'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 53      ; '5'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 74      ; 'J'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 77      ; 'M'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 80      ; 'P'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 100      ; 'd'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 97      ; 'a'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 119      ; 'w'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 117      ; 'u'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 115      ; 's'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 101      ; 'e'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 95
  STORE r13, r8
  ADD r13, r2
  LDI r8, 97      ; 'a'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 58
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 73      ; 'I'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 54      ; '6'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 65      ; 'A'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 54      ; '6'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 52      ; '4'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 100      ; 'd'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 97      ; 'a'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 119      ; 'w'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 58
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 80      ; 'P'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 83      ; 'S'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 69      ; 'E'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 84      ; 'T'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 73      ; 'I'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 50      ; '2'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 54      ; '6'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 65      ; 'A'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 50      ; '2'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 67      ; 'C'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 77      ; 'M'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 80      ; 'P'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 50      ; '2'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 51      ; '3'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 66      ; 'B'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 84      ; 'T'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 99      ; 'c'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 111      ; 'o'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 108      ; 'l'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 65      ; 'A'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 68      ; 'D'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 67      ; 'C'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 77      ; 'M'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 80      ; 'P'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 49      ; '1'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 51      ; '3'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 66      ; 'B'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 84      ; 'T'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 48      ; '0'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 44
  STORE r13, r8
  ADD r13, r2
  LDI r8, 32
  STORE r13, r8
  ADD r13, r2
  LDI r8, 114      ; 'r'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 111      ; 'o'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 119      ; 'w'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 10
  STORE r13, r8
  ADD r13, r2
  LDI r8, 72      ; 'H'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 65      ; 'A'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 76      ; 'L'
  STORE r13, r8
  ADD r13, r2
  LDI r8, 84      ; 'T'
  STORE r13, r8
  ADD r13, r2
  ; Null-terminate
  LDI r8, 0
  STORE r13, r8

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT