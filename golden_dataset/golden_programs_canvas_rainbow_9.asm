; DESCRIPTION: This GeOS assembly code writes a self-modifying program to the canvas buffer at address 0x8000 that generates a rainbow diagonal pattern. The code then assembles and executes this program, resulting in a visual display on the canvas.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r8, 0x8000    ; canvas buffer start
  LDI r7, 1         ; increment
  LDI r1, 76      ; 'L'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 68      ; 'D'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 73      ; 'I'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 114      ; 'r'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 48      ; '0'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 44
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 48      ; '0'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 10
  STORE r8, r1
  ADD r8, r7
  LDI r1, 76      ; 'L'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 68      ; 'D'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 73      ; 'I'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 114      ; 'r'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 44
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 10
  STORE r8, r1
  ADD r8, r7
  LDI r1, 76      ; 'L'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 68      ; 'D'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 73      ; 'I'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 114      ; 'r'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 50      ; '2'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 44
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 50      ; '2'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 53      ; '5'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 54      ; '6'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 10
  STORE r8, r1
  ADD r8, r7
  LDI r1, 108      ; 'l'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 111      ; 'o'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 111      ; 'o'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 112      ; 'p'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 58
  STORE r8, r1
  ADD r8, r7
  LDI r1, 10
  STORE r8, r1
  ADD r8, r7
  LDI r1, 80      ; 'P'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 83      ; 'S'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 69      ; 'E'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 84      ; 'T'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 73      ; 'I'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 114      ; 'r'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 48      ; '0'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 44
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 114      ; 'r'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 48      ; '0'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 44
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 114      ; 'r'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 50      ; '2'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 10
  STORE r8, r1
  ADD r8, r7
  LDI r1, 65      ; 'A'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 68      ; 'D'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 68      ; 'D'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 114      ; 'r'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 48      ; '0'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 44
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 114      ; 'r'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 10
  STORE r8, r1
  ADD r8, r7
  LDI r1, 67      ; 'C'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 77      ; 'M'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 80      ; 'P'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 114      ; 'r'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 48      ; '0'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 44
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 114      ; 'r'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 49      ; '1'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 50      ; '2'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 10
  STORE r8, r1
  ADD r8, r7
  LDI r1, 66      ; 'B'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 76      ; 'L'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 84      ; 'T'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 114      ; 'r'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 48      ; '0'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 44
  STORE r8, r1
  ADD r8, r7
  LDI r1, 32
  STORE r8, r1
  ADD r8, r7
  LDI r1, 108      ; 'l'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 111      ; 'o'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 111      ; 'o'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 112      ; 'p'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 10
  STORE r8, r1
  ADD r8, r7
  LDI r1, 72      ; 'H'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 65      ; 'A'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 76      ; 'L'
  STORE r8, r1
  ADD r8, r7
  LDI r1, 84      ; 'T'
  STORE r8, r1
  ADD r8, r7
  ; Null-terminate
  LDI r1, 0
  STORE r8, r1

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT