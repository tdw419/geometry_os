; DESCRIPTION: A colored line centered at the screen with fixed size.

; canvas_checker.asm
; Self-modifying demo - writes a checkerboard pattern to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r5, 0x8000    ; canvas buffer start
  LDI r12, 1         ; increment
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 73      ; 'I'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 73      ; 'I'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 73      ; 'I'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 50      ; '2'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 56      ; '8'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 73      ; 'I'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 51      ; '3'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 54      ; '6'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 73      ; 'I'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 52      ; '4'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 120      ; 'x'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 70      ; 'F'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 70      ; 'F'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 73      ; 'I'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 53      ; '5'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 120      ; 'x'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 70      ; 'F'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 70      ; 'F'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 111      ; 'o'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 119      ; 'w'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 58
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 73      ; 'I'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 50      ; '2'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 99      ; 'c'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 111      ; 'o'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 108      ; 'l'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 58
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 77      ; 'M'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 79      ; 'O'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 86      ; 'V'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 50      ; '2'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 88      ; 'X'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 79      ; 'O'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 82      ; 'R'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 50      ; '2'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 50      ; '2'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 65      ; 'A'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 78      ; 'N'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 50      ; '2'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 50      ; '2'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 74      ; 'J'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 90      ; 'Z'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 50      ; '2'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 117      ; 'u'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 115      ; 's'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 101      ; 'e'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 95
  STORE r5, r9
  ADD r5, r12
  LDI r9, 97      ; 'a'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 73      ; 'I'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 54      ; '6'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 65      ; 'A'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 54      ; '6'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 53      ; '5'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 74      ; 'J'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 77      ; 'M'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 80      ; 'P'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 100      ; 'd'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 97      ; 'a'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 119      ; 'w'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 117      ; 'u'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 115      ; 's'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 101      ; 'e'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 95
  STORE r5, r9
  ADD r5, r12
  LDI r9, 97      ; 'a'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 58
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 73      ; 'I'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 54      ; '6'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 65      ; 'A'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 54      ; '6'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 52      ; '4'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 100      ; 'd'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 97      ; 'a'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 119      ; 'w'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 58
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 80      ; 'P'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 83      ; 'S'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 69      ; 'E'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 84      ; 'T'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 73      ; 'I'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 50      ; '2'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 54      ; '6'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 65      ; 'A'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 50      ; '2'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 67      ; 'C'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 77      ; 'M'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 80      ; 'P'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 50      ; '2'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 51      ; '3'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 66      ; 'B'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 84      ; 'T'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 99      ; 'c'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 111      ; 'o'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 108      ; 'l'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 65      ; 'A'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 68      ; 'D'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 67      ; 'C'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 77      ; 'M'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 80      ; 'P'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 49      ; '1'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 51      ; '3'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 66      ; 'B'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 84      ; 'T'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 48      ; '0'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 44
  STORE r5, r9
  ADD r5, r12
  LDI r9, 32
  STORE r5, r9
  ADD r5, r12
  LDI r9, 114      ; 'r'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 111      ; 'o'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 119      ; 'w'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 10
  STORE r5, r9
  ADD r5, r12
  LDI r9, 72      ; 'H'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 65      ; 'A'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 76      ; 'L'
  STORE r5, r9
  ADD r5, r12
  LDI r9, 84      ; 'T'
  STORE r5, r9
  ADD r5, r12
  ; Null-terminate
  LDI r9, 0
  STORE r5, r9

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT