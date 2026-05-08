; DESCRIPTION: A colored line centered at the screen with fixed size.

; canvas_checker.asm
; Self-modifying demo - writes a checkerboard pattern to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r7, 0x8000    ; canvas buffer start
  LDI r11, 1         ; increment
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 73      ; 'I'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 73      ; 'I'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 73      ; 'I'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 50      ; '2'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 56      ; '8'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 73      ; 'I'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 51      ; '3'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 54      ; '6'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 73      ; 'I'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 52      ; '4'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 120      ; 'x'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 70      ; 'F'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 70      ; 'F'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 73      ; 'I'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 53      ; '5'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 120      ; 'x'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 70      ; 'F'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 70      ; 'F'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 111      ; 'o'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 119      ; 'w'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 58
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 73      ; 'I'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 50      ; '2'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 99      ; 'c'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 111      ; 'o'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 108      ; 'l'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 58
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 77      ; 'M'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 79      ; 'O'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 86      ; 'V'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 50      ; '2'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 88      ; 'X'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 79      ; 'O'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 82      ; 'R'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 50      ; '2'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 50      ; '2'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 65      ; 'A'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 78      ; 'N'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 50      ; '2'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 50      ; '2'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 74      ; 'J'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 90      ; 'Z'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 50      ; '2'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 117      ; 'u'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 115      ; 's'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 101      ; 'e'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 95
  STORE r7, r0
  ADD r7, r11
  LDI r0, 97      ; 'a'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 73      ; 'I'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 54      ; '6'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 65      ; 'A'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 54      ; '6'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 53      ; '5'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 74      ; 'J'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 77      ; 'M'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 80      ; 'P'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 100      ; 'd'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 97      ; 'a'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 119      ; 'w'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 117      ; 'u'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 115      ; 's'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 101      ; 'e'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 95
  STORE r7, r0
  ADD r7, r11
  LDI r0, 97      ; 'a'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 58
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 73      ; 'I'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 54      ; '6'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 65      ; 'A'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 54      ; '6'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 52      ; '4'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 100      ; 'd'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 97      ; 'a'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 119      ; 'w'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 58
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 80      ; 'P'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 83      ; 'S'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 69      ; 'E'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 84      ; 'T'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 73      ; 'I'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 50      ; '2'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 54      ; '6'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 65      ; 'A'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 50      ; '2'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 67      ; 'C'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 77      ; 'M'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 80      ; 'P'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 50      ; '2'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 51      ; '3'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 66      ; 'B'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 84      ; 'T'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 99      ; 'c'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 111      ; 'o'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 108      ; 'l'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 65      ; 'A'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 68      ; 'D'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 67      ; 'C'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 77      ; 'M'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 80      ; 'P'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 49      ; '1'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 51      ; '3'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 66      ; 'B'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 84      ; 'T'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 48      ; '0'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 44
  STORE r7, r0
  ADD r7, r11
  LDI r0, 32
  STORE r7, r0
  ADD r7, r11
  LDI r0, 114      ; 'r'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 111      ; 'o'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 119      ; 'w'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 10
  STORE r7, r0
  ADD r7, r11
  LDI r0, 72      ; 'H'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 65      ; 'A'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 76      ; 'L'
  STORE r7, r0
  ADD r7, r11
  LDI r0, 84      ; 'T'
  STORE r7, r0
  ADD r7, r11
  ; Null-terminate
  LDI r0, 0
  STORE r7, r0

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT