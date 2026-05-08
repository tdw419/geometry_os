; DESCRIPTION: Draws a colored line at the screen with fixed size.

; canvas_checker.asm
; Self-modifying demo - writes a checkerboard pattern to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r10, 0x8000    ; canvas buffer start
  LDI r14, 1         ; increment
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 73      ; 'I'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 73      ; 'I'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 73      ; 'I'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 50      ; '2'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 56      ; '8'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 73      ; 'I'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 51      ; '3'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 54      ; '6'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 73      ; 'I'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 52      ; '4'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 120      ; 'x'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 70      ; 'F'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 70      ; 'F'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 73      ; 'I'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 53      ; '5'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 120      ; 'x'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 70      ; 'F'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 70      ; 'F'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 111      ; 'o'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 119      ; 'w'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 58
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 73      ; 'I'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 50      ; '2'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 99      ; 'c'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 111      ; 'o'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 108      ; 'l'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 58
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 77      ; 'M'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 79      ; 'O'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 86      ; 'V'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 50      ; '2'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 88      ; 'X'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 79      ; 'O'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 82      ; 'R'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 50      ; '2'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 50      ; '2'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 65      ; 'A'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 78      ; 'N'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 50      ; '2'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 50      ; '2'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 74      ; 'J'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 90      ; 'Z'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 50      ; '2'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 117      ; 'u'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 115      ; 's'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 101      ; 'e'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 95
  STORE r10, r15
  ADD r10, r14
  LDI r15, 97      ; 'a'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 73      ; 'I'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 54      ; '6'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 65      ; 'A'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 54      ; '6'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 53      ; '5'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 74      ; 'J'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 77      ; 'M'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 80      ; 'P'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 100      ; 'd'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 97      ; 'a'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 119      ; 'w'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 117      ; 'u'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 115      ; 's'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 101      ; 'e'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 95
  STORE r10, r15
  ADD r10, r14
  LDI r15, 97      ; 'a'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 58
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 73      ; 'I'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 54      ; '6'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 65      ; 'A'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 54      ; '6'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 52      ; '4'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 100      ; 'd'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 97      ; 'a'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 119      ; 'w'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 58
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 80      ; 'P'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 83      ; 'S'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 69      ; 'E'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 84      ; 'T'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 73      ; 'I'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 50      ; '2'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 54      ; '6'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 65      ; 'A'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 50      ; '2'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 67      ; 'C'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 77      ; 'M'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 80      ; 'P'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 50      ; '2'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 51      ; '3'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 66      ; 'B'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 84      ; 'T'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 99      ; 'c'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 111      ; 'o'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 108      ; 'l'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 65      ; 'A'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 68      ; 'D'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 67      ; 'C'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 77      ; 'M'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 80      ; 'P'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 49      ; '1'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 51      ; '3'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 66      ; 'B'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 84      ; 'T'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 48      ; '0'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 44
  STORE r10, r15
  ADD r10, r14
  LDI r15, 32
  STORE r10, r15
  ADD r10, r14
  LDI r15, 114      ; 'r'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 111      ; 'o'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 119      ; 'w'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 10
  STORE r10, r15
  ADD r10, r14
  LDI r15, 72      ; 'H'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 65      ; 'A'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 76      ; 'L'
  STORE r10, r15
  ADD r10, r14
  LDI r15, 84      ; 'T'
  STORE r10, r15
  ADD r10, r14
  ; Null-terminate
  LDI r15, 0
  STORE r10, r15

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT