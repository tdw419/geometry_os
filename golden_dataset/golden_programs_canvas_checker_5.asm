; DESCRIPTION: This GeOS assembly code writes a checkerboard pattern to a canvas buffer starting at address 0x8000. It then assembles the written text into machine code and executes it using `ASMSELF` and `RUNNEXT`. The pattern consists of repeated sequences of characters forming lines with coordinates and labels, followed by additional commands and parameters.

; canvas_checker.asm
; Self-modifying demo - writes a checkerboard pattern to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r3, 0x8000    ; canvas buffer start
  LDI r8, 1         ; increment
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 73      ; 'I'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 73      ; 'I'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 73      ; 'I'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 50      ; '2'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 56      ; '8'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 73      ; 'I'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 51      ; '3'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 54      ; '6'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 73      ; 'I'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 52      ; '4'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 120      ; 'x'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 70      ; 'F'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 70      ; 'F'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 73      ; 'I'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 53      ; '5'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 120      ; 'x'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 70      ; 'F'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 70      ; 'F'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 111      ; 'o'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 119      ; 'w'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 58
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 73      ; 'I'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 50      ; '2'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 99      ; 'c'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 111      ; 'o'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 108      ; 'l'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 58
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 77      ; 'M'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 79      ; 'O'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 86      ; 'V'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 50      ; '2'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 88      ; 'X'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 79      ; 'O'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 82      ; 'R'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 50      ; '2'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 50      ; '2'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 65      ; 'A'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 78      ; 'N'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 50      ; '2'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 50      ; '2'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 74      ; 'J'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 90      ; 'Z'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 50      ; '2'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 117      ; 'u'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 115      ; 's'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 101      ; 'e'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 95
  STORE r3, r7
  ADD r3, r8
  LDI r7, 97      ; 'a'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 73      ; 'I'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 54      ; '6'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 65      ; 'A'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 54      ; '6'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 53      ; '5'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 74      ; 'J'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 77      ; 'M'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 80      ; 'P'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 100      ; 'd'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 97      ; 'a'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 119      ; 'w'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 117      ; 'u'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 115      ; 's'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 101      ; 'e'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 95
  STORE r3, r7
  ADD r3, r8
  LDI r7, 97      ; 'a'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 58
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 73      ; 'I'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 54      ; '6'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 65      ; 'A'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 54      ; '6'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 52      ; '4'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 100      ; 'd'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 97      ; 'a'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 119      ; 'w'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 58
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 80      ; 'P'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 83      ; 'S'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 69      ; 'E'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 84      ; 'T'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 73      ; 'I'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 50      ; '2'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 54      ; '6'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 65      ; 'A'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 50      ; '2'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 67      ; 'C'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 77      ; 'M'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 80      ; 'P'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 50      ; '2'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 51      ; '3'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 66      ; 'B'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 84      ; 'T'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 99      ; 'c'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 111      ; 'o'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 108      ; 'l'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 65      ; 'A'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 68      ; 'D'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 67      ; 'C'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 77      ; 'M'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 80      ; 'P'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 49      ; '1'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 51      ; '3'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 66      ; 'B'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 84      ; 'T'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 48      ; '0'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 44
  STORE r3, r7
  ADD r3, r8
  LDI r7, 32
  STORE r3, r7
  ADD r3, r8
  LDI r7, 114      ; 'r'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 111      ; 'o'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 119      ; 'w'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 10
  STORE r3, r7
  ADD r3, r8
  LDI r7, 72      ; 'H'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 65      ; 'A'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 76      ; 'L'
  STORE r3, r7
  ADD r3, r8
  LDI r7, 84      ; 'T'
  STORE r3, r7
  ADD r3, r8
  ; Null-terminate
  LDI r7, 0
  STORE r3, r7

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT