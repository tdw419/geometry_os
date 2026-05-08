; DESCRIPTION: This GeOS assembly code writes a checkerboard pattern to a canvas buffer starting at address 0x8000. It then assembles the written text into machine code and executes it using `ASMSELF` and `RUNNEXT`. The pattern consists of repeated sequences of characters forming lines with coordinates and labels, followed by additional commands and parameters.

; canvas_checker.asm
; Self-modifying demo - writes a checkerboard pattern to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r4, 0x8000    ; canvas buffer start
  LDI r11, 1         ; increment
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 73      ; 'I'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 73      ; 'I'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 73      ; 'I'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 50      ; '2'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 56      ; '8'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 73      ; 'I'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 51      ; '3'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 54      ; '6'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 73      ; 'I'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 52      ; '4'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 120      ; 'x'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 70      ; 'F'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 70      ; 'F'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 73      ; 'I'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 53      ; '5'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 120      ; 'x'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 70      ; 'F'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 70      ; 'F'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 111      ; 'o'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 119      ; 'w'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 58
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 73      ; 'I'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 50      ; '2'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 99      ; 'c'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 111      ; 'o'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 108      ; 'l'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 58
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 77      ; 'M'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 79      ; 'O'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 86      ; 'V'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 50      ; '2'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 88      ; 'X'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 79      ; 'O'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 82      ; 'R'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 50      ; '2'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 50      ; '2'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 65      ; 'A'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 78      ; 'N'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 50      ; '2'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 50      ; '2'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 74      ; 'J'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 90      ; 'Z'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 50      ; '2'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 117      ; 'u'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 115      ; 's'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 101      ; 'e'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 95
  STORE r4, r12
  ADD r4, r11
  LDI r12, 97      ; 'a'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 73      ; 'I'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 54      ; '6'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 65      ; 'A'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 54      ; '6'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 53      ; '5'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 74      ; 'J'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 77      ; 'M'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 80      ; 'P'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 100      ; 'd'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 97      ; 'a'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 119      ; 'w'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 117      ; 'u'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 115      ; 's'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 101      ; 'e'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 95
  STORE r4, r12
  ADD r4, r11
  LDI r12, 97      ; 'a'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 58
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 73      ; 'I'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 54      ; '6'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 65      ; 'A'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 54      ; '6'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 52      ; '4'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 100      ; 'd'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 97      ; 'a'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 119      ; 'w'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 58
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 80      ; 'P'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 83      ; 'S'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 69      ; 'E'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 84      ; 'T'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 73      ; 'I'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 50      ; '2'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 54      ; '6'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 65      ; 'A'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 50      ; '2'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 67      ; 'C'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 77      ; 'M'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 80      ; 'P'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 50      ; '2'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 51      ; '3'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 66      ; 'B'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 84      ; 'T'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 99      ; 'c'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 111      ; 'o'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 108      ; 'l'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 65      ; 'A'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 68      ; 'D'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 67      ; 'C'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 77      ; 'M'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 80      ; 'P'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 49      ; '1'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 51      ; '3'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 66      ; 'B'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 84      ; 'T'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 48      ; '0'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 44
  STORE r4, r12
  ADD r4, r11
  LDI r12, 32
  STORE r4, r12
  ADD r4, r11
  LDI r12, 114      ; 'r'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 111      ; 'o'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 119      ; 'w'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 10
  STORE r4, r12
  ADD r4, r11
  LDI r12, 72      ; 'H'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 65      ; 'A'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 76      ; 'L'
  STORE r4, r12
  ADD r4, r11
  LDI r12, 84      ; 'T'
  STORE r4, r12
  ADD r4, r11
  ; Null-terminate
  LDI r12, 0
  STORE r4, r12

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT