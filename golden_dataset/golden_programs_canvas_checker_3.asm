; DESCRIPTION: Display a line using color colored at the screen.

; canvas_checker.asm
; Self-modifying demo - writes a checkerboard pattern to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r15, 0x8000    ; canvas buffer start
  LDI r11, 1         ; increment
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 73      ; 'I'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 73      ; 'I'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 73      ; 'I'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 50      ; '2'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 56      ; '8'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 73      ; 'I'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 51      ; '3'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 54      ; '6'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 73      ; 'I'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 52      ; '4'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 120      ; 'x'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 70      ; 'F'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 70      ; 'F'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 73      ; 'I'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 53      ; '5'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 120      ; 'x'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 70      ; 'F'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 70      ; 'F'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 111      ; 'o'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 119      ; 'w'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 58
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 73      ; 'I'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 50      ; '2'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 99      ; 'c'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 111      ; 'o'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 108      ; 'l'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 58
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 77      ; 'M'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 79      ; 'O'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 86      ; 'V'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 50      ; '2'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 88      ; 'X'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 79      ; 'O'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 82      ; 'R'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 50      ; '2'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 50      ; '2'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 65      ; 'A'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 78      ; 'N'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 50      ; '2'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 50      ; '2'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 74      ; 'J'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 90      ; 'Z'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 50      ; '2'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 117      ; 'u'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 115      ; 's'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 101      ; 'e'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 95
  STORE r15, r0
  ADD r15, r11
  LDI r0, 97      ; 'a'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 73      ; 'I'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 54      ; '6'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 65      ; 'A'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 54      ; '6'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 53      ; '5'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 74      ; 'J'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 77      ; 'M'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 80      ; 'P'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 100      ; 'd'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 97      ; 'a'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 119      ; 'w'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 117      ; 'u'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 115      ; 's'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 101      ; 'e'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 95
  STORE r15, r0
  ADD r15, r11
  LDI r0, 97      ; 'a'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 58
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 73      ; 'I'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 54      ; '6'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 65      ; 'A'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 54      ; '6'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 52      ; '4'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 100      ; 'd'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 97      ; 'a'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 119      ; 'w'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 58
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 80      ; 'P'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 83      ; 'S'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 69      ; 'E'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 84      ; 'T'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 73      ; 'I'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 50      ; '2'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 54      ; '6'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 65      ; 'A'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 50      ; '2'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 67      ; 'C'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 77      ; 'M'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 80      ; 'P'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 50      ; '2'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 51      ; '3'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 66      ; 'B'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 84      ; 'T'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 99      ; 'c'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 111      ; 'o'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 108      ; 'l'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 65      ; 'A'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 68      ; 'D'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 67      ; 'C'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 77      ; 'M'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 80      ; 'P'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 49      ; '1'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 51      ; '3'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 66      ; 'B'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 84      ; 'T'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 48      ; '0'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 44
  STORE r15, r0
  ADD r15, r11
  LDI r0, 32
  STORE r15, r0
  ADD r15, r11
  LDI r0, 114      ; 'r'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 111      ; 'o'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 119      ; 'w'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 10
  STORE r15, r0
  ADD r15, r11
  LDI r0, 72      ; 'H'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 65      ; 'A'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 76      ; 'L'
  STORE r15, r0
  ADD r15, r11
  LDI r0, 84      ; 'T'
  STORE r15, r0
  ADD r15, r11
  ; Null-terminate
  LDI r0, 0
  STORE r15, r0

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT