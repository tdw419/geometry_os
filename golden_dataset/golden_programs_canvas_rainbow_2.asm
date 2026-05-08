; DESCRIPTION: Display a object using color colored at the screen.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r3, 0x8000    ; canvas buffer start
  LDI r7, 1         ; increment
  LDI r6, 76      ; 'L'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 68      ; 'D'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 73      ; 'I'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 114      ; 'r'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 48      ; '0'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 44
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 48      ; '0'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 10
  STORE r3, r6
  ADD r3, r7
  LDI r6, 76      ; 'L'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 68      ; 'D'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 73      ; 'I'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 114      ; 'r'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 44
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 10
  STORE r3, r6
  ADD r3, r7
  LDI r6, 76      ; 'L'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 68      ; 'D'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 73      ; 'I'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 114      ; 'r'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 50      ; '2'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 44
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 50      ; '2'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 53      ; '5'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 54      ; '6'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 10
  STORE r3, r6
  ADD r3, r7
  LDI r6, 108      ; 'l'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 111      ; 'o'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 111      ; 'o'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 112      ; 'p'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 58
  STORE r3, r6
  ADD r3, r7
  LDI r6, 10
  STORE r3, r6
  ADD r3, r7
  LDI r6, 80      ; 'P'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 83      ; 'S'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 69      ; 'E'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 84      ; 'T'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 73      ; 'I'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 114      ; 'r'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 48      ; '0'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 44
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 114      ; 'r'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 48      ; '0'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 44
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 114      ; 'r'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 50      ; '2'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 10
  STORE r3, r6
  ADD r3, r7
  LDI r6, 65      ; 'A'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 68      ; 'D'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 68      ; 'D'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 114      ; 'r'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 48      ; '0'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 44
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 114      ; 'r'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 10
  STORE r3, r6
  ADD r3, r7
  LDI r6, 67      ; 'C'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 77      ; 'M'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 80      ; 'P'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 114      ; 'r'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 48      ; '0'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 44
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 114      ; 'r'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 49      ; '1'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 50      ; '2'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 10
  STORE r3, r6
  ADD r3, r7
  LDI r6, 66      ; 'B'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 76      ; 'L'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 84      ; 'T'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 114      ; 'r'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 48      ; '0'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 44
  STORE r3, r6
  ADD r3, r7
  LDI r6, 32
  STORE r3, r6
  ADD r3, r7
  LDI r6, 108      ; 'l'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 111      ; 'o'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 111      ; 'o'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 112      ; 'p'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 10
  STORE r3, r6
  ADD r3, r7
  LDI r6, 72      ; 'H'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 65      ; 'A'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 76      ; 'L'
  STORE r3, r6
  ADD r3, r7
  LDI r6, 84      ; 'T'
  STORE r3, r6
  ADD r3, r7
  ; Null-terminate
  LDI r6, 0
  STORE r3, r6

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT