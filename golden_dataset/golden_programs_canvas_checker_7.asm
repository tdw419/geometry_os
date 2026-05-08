; DESCRIPTION: This GeOS assembly code writes a checkerboard pattern to a canvas buffer starting at address 0x8000. It then assembles the written text into machine code and executes it using `ASMSELF` and `RUNNEXT`. The pattern consists of repeated sequences of characters forming lines with coordinates and labels, followed by additional commands and parameters.

; canvas_checker.asm
; Self-modifying demo - writes a checkerboard pattern to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r2, 0x8000    ; canvas buffer start
  LDI r8, 1         ; increment
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 73      ; 'I'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 73      ; 'I'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 73      ; 'I'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 50      ; '2'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 56      ; '8'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 73      ; 'I'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 51      ; '3'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 54      ; '6'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 73      ; 'I'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 52      ; '4'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 120      ; 'x'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 70      ; 'F'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 70      ; 'F'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 73      ; 'I'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 53      ; '5'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 120      ; 'x'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 70      ; 'F'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 70      ; 'F'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 111      ; 'o'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 119      ; 'w'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 58
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 73      ; 'I'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 50      ; '2'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 99      ; 'c'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 111      ; 'o'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 108      ; 'l'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 58
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 77      ; 'M'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 79      ; 'O'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 86      ; 'V'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 50      ; '2'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 88      ; 'X'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 79      ; 'O'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 82      ; 'R'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 50      ; '2'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 50      ; '2'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 65      ; 'A'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 78      ; 'N'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 50      ; '2'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 50      ; '2'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 74      ; 'J'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 90      ; 'Z'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 50      ; '2'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 117      ; 'u'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 115      ; 's'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 101      ; 'e'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 95
  STORE r2, r1
  ADD r2, r8
  LDI r1, 97      ; 'a'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 73      ; 'I'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 54      ; '6'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 65      ; 'A'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 54      ; '6'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 53      ; '5'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 74      ; 'J'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 77      ; 'M'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 80      ; 'P'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 100      ; 'd'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 97      ; 'a'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 119      ; 'w'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 117      ; 'u'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 115      ; 's'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 101      ; 'e'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 95
  STORE r2, r1
  ADD r2, r8
  LDI r1, 97      ; 'a'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 58
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 73      ; 'I'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 54      ; '6'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 65      ; 'A'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 54      ; '6'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 52      ; '4'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 100      ; 'd'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 97      ; 'a'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 119      ; 'w'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 58
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 80      ; 'P'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 83      ; 'S'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 69      ; 'E'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 84      ; 'T'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 73      ; 'I'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 50      ; '2'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 54      ; '6'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 65      ; 'A'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 50      ; '2'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 67      ; 'C'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 77      ; 'M'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 80      ; 'P'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 50      ; '2'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 51      ; '3'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 66      ; 'B'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 84      ; 'T'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 99      ; 'c'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 111      ; 'o'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 108      ; 'l'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 65      ; 'A'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 68      ; 'D'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 67      ; 'C'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 77      ; 'M'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 80      ; 'P'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 49      ; '1'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 51      ; '3'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 66      ; 'B'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 84      ; 'T'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 48      ; '0'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 44
  STORE r2, r1
  ADD r2, r8
  LDI r1, 32
  STORE r2, r1
  ADD r2, r8
  LDI r1, 114      ; 'r'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 111      ; 'o'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 119      ; 'w'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 10
  STORE r2, r1
  ADD r2, r8
  LDI r1, 72      ; 'H'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 65      ; 'A'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 76      ; 'L'
  STORE r2, r1
  ADD r2, r8
  LDI r1, 84      ; 'T'
  STORE r2, r1
  ADD r2, r8
  ; Null-terminate
  LDI r1, 0
  STORE r2, r1

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT