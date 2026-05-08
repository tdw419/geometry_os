; DESCRIPTION: Draws a colored object at the screen with fixed size.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r0, 0x8000    ; canvas buffer start
  LDI r11, 1         ; increment
  LDI r9, 76      ; 'L'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 68      ; 'D'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 73      ; 'I'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 114      ; 'r'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 48      ; '0'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 44
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 48      ; '0'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 10
  STORE r0, r9
  ADD r0, r11
  LDI r9, 76      ; 'L'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 68      ; 'D'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 73      ; 'I'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 114      ; 'r'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 44
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 10
  STORE r0, r9
  ADD r0, r11
  LDI r9, 76      ; 'L'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 68      ; 'D'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 73      ; 'I'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 114      ; 'r'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 50      ; '2'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 44
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 50      ; '2'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 53      ; '5'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 54      ; '6'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 10
  STORE r0, r9
  ADD r0, r11
  LDI r9, 108      ; 'l'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 111      ; 'o'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 111      ; 'o'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 112      ; 'p'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 58
  STORE r0, r9
  ADD r0, r11
  LDI r9, 10
  STORE r0, r9
  ADD r0, r11
  LDI r9, 80      ; 'P'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 83      ; 'S'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 69      ; 'E'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 84      ; 'T'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 73      ; 'I'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 114      ; 'r'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 48      ; '0'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 44
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 114      ; 'r'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 48      ; '0'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 44
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 114      ; 'r'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 50      ; '2'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 10
  STORE r0, r9
  ADD r0, r11
  LDI r9, 65      ; 'A'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 68      ; 'D'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 68      ; 'D'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 114      ; 'r'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 48      ; '0'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 44
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 114      ; 'r'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 10
  STORE r0, r9
  ADD r0, r11
  LDI r9, 67      ; 'C'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 77      ; 'M'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 80      ; 'P'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 114      ; 'r'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 48      ; '0'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 44
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 114      ; 'r'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 49      ; '1'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 50      ; '2'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 10
  STORE r0, r9
  ADD r0, r11
  LDI r9, 66      ; 'B'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 76      ; 'L'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 84      ; 'T'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 114      ; 'r'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 48      ; '0'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 44
  STORE r0, r9
  ADD r0, r11
  LDI r9, 32
  STORE r0, r9
  ADD r0, r11
  LDI r9, 108      ; 'l'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 111      ; 'o'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 111      ; 'o'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 112      ; 'p'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 10
  STORE r0, r9
  ADD r0, r11
  LDI r9, 72      ; 'H'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 65      ; 'A'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 76      ; 'L'
  STORE r0, r9
  ADD r0, r11
  LDI r9, 84      ; 'T'
  STORE r0, r9
  ADD r0, r11
  ; Null-terminate
  LDI r9, 0
  STORE r0, r9

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT