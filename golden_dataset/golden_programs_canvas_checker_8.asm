; DESCRIPTION: This GeOS assembly code writes a checkerboard pattern to a canvas buffer starting at address 0x8000. It then assembles the written text into machine code and executes it using `ASMSELF` and `RUNNEXT`. The pattern consists of repeated sequences of characters forming lines with coordinates and labels, followed by additional commands and parameters.

; canvas_checker.asm
; Self-modifying demo - writes a checkerboard pattern to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r15, 0x8000    ; canvas buffer start
  LDI r13, 1         ; increment
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 56      ; '8'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 54      ; '6'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 52      ; '4'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 120      ; 'x'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 53      ; '5'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 120      ; 'x'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 70      ; 'F'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 111      ; 'o'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 119      ; 'w'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 58
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 99      ; 'c'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 111      ; 'o'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 108      ; 'l'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 58
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 77      ; 'M'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 79      ; 'O'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 86      ; 'V'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 88      ; 'X'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 79      ; 'O'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 82      ; 'R'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 78      ; 'N'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 74      ; 'J'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 90      ; 'Z'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 117      ; 'u'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 115      ; 's'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 101      ; 'e'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 95
  STORE r15, r4
  ADD r15, r13
  LDI r4, 97      ; 'a'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 54      ; '6'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 54      ; '6'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 53      ; '5'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 74      ; 'J'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 77      ; 'M'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 100      ; 'd'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 97      ; 'a'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 119      ; 'w'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 117      ; 'u'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 115      ; 's'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 101      ; 'e'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 95
  STORE r15, r4
  ADD r15, r13
  LDI r4, 97      ; 'a'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 58
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 54      ; '6'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 54      ; '6'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 52      ; '4'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 100      ; 'd'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 97      ; 'a'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 119      ; 'w'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 58
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 83      ; 'S'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 69      ; 'E'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 73      ; 'I'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 54      ; '6'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 67      ; 'C'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 77      ; 'M'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 50      ; '2'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 66      ; 'B'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 99      ; 'c'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 111      ; 'o'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 108      ; 'l'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 68      ; 'D'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 67      ; 'C'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 77      ; 'M'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 80      ; 'P'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 49      ; '1'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 51      ; '3'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 66      ; 'B'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 48      ; '0'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 44
  STORE r15, r4
  ADD r15, r13
  LDI r4, 32
  STORE r15, r4
  ADD r15, r13
  LDI r4, 114      ; 'r'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 111      ; 'o'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 119      ; 'w'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 10
  STORE r15, r4
  ADD r15, r13
  LDI r4, 72      ; 'H'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 65      ; 'A'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 76      ; 'L'
  STORE r15, r4
  ADD r15, r13
  LDI r4, 84      ; 'T'
  STORE r15, r4
  ADD r15, r13
  ; Null-terminate
  LDI r4, 0
  STORE r15, r4

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT