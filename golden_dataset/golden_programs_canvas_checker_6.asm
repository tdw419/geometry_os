; DESCRIPTION: Draws a colored line at the screen with fixed size.

; canvas_checker.asm
; Self-modifying demo - writes a checkerboard pattern to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r0, 0x8000    ; canvas buffer start
  LDI r4, 1         ; increment
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 73      ; 'I'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 73      ; 'I'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 73      ; 'I'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 50      ; '2'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 56      ; '8'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 73      ; 'I'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 51      ; '3'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 54      ; '6'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 73      ; 'I'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 52      ; '4'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 120      ; 'x'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 70      ; 'F'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 70      ; 'F'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 73      ; 'I'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 53      ; '5'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 120      ; 'x'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 70      ; 'F'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 70      ; 'F'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 111      ; 'o'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 119      ; 'w'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 58
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 73      ; 'I'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 50      ; '2'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 99      ; 'c'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 111      ; 'o'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 108      ; 'l'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 58
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 77      ; 'M'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 79      ; 'O'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 86      ; 'V'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 50      ; '2'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 88      ; 'X'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 79      ; 'O'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 82      ; 'R'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 50      ; '2'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 50      ; '2'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 65      ; 'A'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 78      ; 'N'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 50      ; '2'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 50      ; '2'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 74      ; 'J'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 90      ; 'Z'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 50      ; '2'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 117      ; 'u'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 115      ; 's'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 101      ; 'e'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 95
  STORE r0, r8
  ADD r0, r4
  LDI r8, 97      ; 'a'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 73      ; 'I'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 54      ; '6'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 65      ; 'A'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 54      ; '6'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 53      ; '5'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 74      ; 'J'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 77      ; 'M'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 80      ; 'P'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 100      ; 'd'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 97      ; 'a'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 119      ; 'w'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 117      ; 'u'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 115      ; 's'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 101      ; 'e'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 95
  STORE r0, r8
  ADD r0, r4
  LDI r8, 97      ; 'a'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 58
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 73      ; 'I'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 54      ; '6'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 65      ; 'A'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 54      ; '6'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 52      ; '4'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 100      ; 'd'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 97      ; 'a'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 119      ; 'w'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 58
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 80      ; 'P'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 83      ; 'S'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 69      ; 'E'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 84      ; 'T'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 73      ; 'I'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 50      ; '2'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 54      ; '6'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 65      ; 'A'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 50      ; '2'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 67      ; 'C'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 77      ; 'M'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 80      ; 'P'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 50      ; '2'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 51      ; '3'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 66      ; 'B'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 84      ; 'T'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 99      ; 'c'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 111      ; 'o'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 108      ; 'l'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 65      ; 'A'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 68      ; 'D'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 67      ; 'C'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 77      ; 'M'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 80      ; 'P'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 49      ; '1'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 51      ; '3'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 66      ; 'B'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 84      ; 'T'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 48      ; '0'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 44
  STORE r0, r8
  ADD r0, r4
  LDI r8, 32
  STORE r0, r8
  ADD r0, r4
  LDI r8, 114      ; 'r'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 111      ; 'o'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 119      ; 'w'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 10
  STORE r0, r8
  ADD r0, r4
  LDI r8, 72      ; 'H'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 65      ; 'A'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 76      ; 'L'
  STORE r0, r8
  ADD r0, r4
  LDI r8, 84      ; 'T'
  STORE r0, r8
  ADD r0, r4
  ; Null-terminate
  LDI r8, 0
  STORE r0, r8

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT