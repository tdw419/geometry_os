; DESCRIPTION: Render a colored object at the screen.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r3, 0x8000    ; canvas buffer start
  LDI r5, 1         ; increment
  LDI r12, 76      ; 'L'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 68      ; 'D'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 73      ; 'I'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 114      ; 'r'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 48      ; '0'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 44
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 48      ; '0'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 10
  STORE r3, r12
  ADD r3, r5
  LDI r12, 76      ; 'L'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 68      ; 'D'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 73      ; 'I'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 114      ; 'r'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 44
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 10
  STORE r3, r12
  ADD r3, r5
  LDI r12, 76      ; 'L'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 68      ; 'D'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 73      ; 'I'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 114      ; 'r'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 50      ; '2'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 44
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 50      ; '2'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 53      ; '5'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 54      ; '6'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 10
  STORE r3, r12
  ADD r3, r5
  LDI r12, 108      ; 'l'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 111      ; 'o'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 111      ; 'o'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 112      ; 'p'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 58
  STORE r3, r12
  ADD r3, r5
  LDI r12, 10
  STORE r3, r12
  ADD r3, r5
  LDI r12, 80      ; 'P'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 83      ; 'S'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 69      ; 'E'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 84      ; 'T'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 73      ; 'I'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 114      ; 'r'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 48      ; '0'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 44
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 114      ; 'r'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 48      ; '0'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 44
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 114      ; 'r'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 50      ; '2'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 10
  STORE r3, r12
  ADD r3, r5
  LDI r12, 65      ; 'A'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 68      ; 'D'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 68      ; 'D'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 114      ; 'r'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 48      ; '0'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 44
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 114      ; 'r'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 10
  STORE r3, r12
  ADD r3, r5
  LDI r12, 67      ; 'C'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 77      ; 'M'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 80      ; 'P'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 114      ; 'r'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 48      ; '0'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 44
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 114      ; 'r'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 49      ; '1'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 50      ; '2'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 10
  STORE r3, r12
  ADD r3, r5
  LDI r12, 66      ; 'B'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 76      ; 'L'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 84      ; 'T'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 114      ; 'r'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 48      ; '0'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 44
  STORE r3, r12
  ADD r3, r5
  LDI r12, 32
  STORE r3, r12
  ADD r3, r5
  LDI r12, 108      ; 'l'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 111      ; 'o'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 111      ; 'o'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 112      ; 'p'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 10
  STORE r3, r12
  ADD r3, r5
  LDI r12, 72      ; 'H'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 65      ; 'A'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 76      ; 'L'
  STORE r3, r12
  ADD r3, r5
  LDI r12, 84      ; 'T'
  STORE r3, r12
  ADD r3, r5
  ; Null-terminate
  LDI r12, 0
  STORE r3, r12

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT