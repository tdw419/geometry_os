; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r12, 0x8000    ; canvas buffer start
  LDI r3, 1         ; increment
  LDI r4, 76      ; 'L'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 68      ; 'D'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 73      ; 'I'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 114      ; 'r'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 48      ; '0'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 44
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 48      ; '0'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 10
  STORE r12, r4
  ADD r12, r3
  LDI r4, 76      ; 'L'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 68      ; 'D'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 73      ; 'I'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 114      ; 'r'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 44
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 10
  STORE r12, r4
  ADD r12, r3
  LDI r4, 76      ; 'L'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 68      ; 'D'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 73      ; 'I'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 114      ; 'r'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 50      ; '2'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 44
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 50      ; '2'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 53      ; '5'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 54      ; '6'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 10
  STORE r12, r4
  ADD r12, r3
  LDI r4, 108      ; 'l'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 111      ; 'o'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 111      ; 'o'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 112      ; 'p'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 58
  STORE r12, r4
  ADD r12, r3
  LDI r4, 10
  STORE r12, r4
  ADD r12, r3
  LDI r4, 80      ; 'P'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 83      ; 'S'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 69      ; 'E'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 84      ; 'T'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 73      ; 'I'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 114      ; 'r'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 48      ; '0'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 44
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 114      ; 'r'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 48      ; '0'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 44
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 114      ; 'r'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 50      ; '2'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 10
  STORE r12, r4
  ADD r12, r3
  LDI r4, 65      ; 'A'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 68      ; 'D'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 68      ; 'D'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 114      ; 'r'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 48      ; '0'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 44
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 114      ; 'r'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 10
  STORE r12, r4
  ADD r12, r3
  LDI r4, 67      ; 'C'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 77      ; 'M'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 80      ; 'P'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 114      ; 'r'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 48      ; '0'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 44
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 114      ; 'r'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 49      ; '1'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 50      ; '2'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 10
  STORE r12, r4
  ADD r12, r3
  LDI r4, 66      ; 'B'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 76      ; 'L'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 84      ; 'T'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 114      ; 'r'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 48      ; '0'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 44
  STORE r12, r4
  ADD r12, r3
  LDI r4, 32
  STORE r12, r4
  ADD r12, r3
  LDI r4, 108      ; 'l'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 111      ; 'o'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 111      ; 'o'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 112      ; 'p'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 10
  STORE r12, r4
  ADD r12, r3
  LDI r4, 72      ; 'H'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 65      ; 'A'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 76      ; 'L'
  STORE r12, r4
  ADD r12, r3
  LDI r4, 84      ; 'T'
  STORE r12, r4
  ADD r12, r3
  ; Null-terminate
  LDI r4, 0
  STORE r12, r4

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT