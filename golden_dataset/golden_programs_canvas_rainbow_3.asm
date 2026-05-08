; DESCRIPTION: This GeOS assembly code writes a self-modifying program to the canvas buffer at address 0x8000 that generates a rainbow diagonal pattern. The code then assembles and executes this program, resulting in a visual display on the canvas.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r12, 0x8000    ; canvas buffer start
  LDI r5, 1         ; increment
  LDI r6, 76      ; 'L'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 68      ; 'D'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 73      ; 'I'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 114      ; 'r'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 48      ; '0'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 44
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 48      ; '0'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 10
  STORE r12, r6
  ADD r12, r5
  LDI r6, 76      ; 'L'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 68      ; 'D'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 73      ; 'I'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 114      ; 'r'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 44
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 10
  STORE r12, r6
  ADD r12, r5
  LDI r6, 76      ; 'L'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 68      ; 'D'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 73      ; 'I'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 114      ; 'r'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 50      ; '2'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 44
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 50      ; '2'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 53      ; '5'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 54      ; '6'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 10
  STORE r12, r6
  ADD r12, r5
  LDI r6, 108      ; 'l'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 111      ; 'o'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 111      ; 'o'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 112      ; 'p'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 58
  STORE r12, r6
  ADD r12, r5
  LDI r6, 10
  STORE r12, r6
  ADD r12, r5
  LDI r6, 80      ; 'P'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 83      ; 'S'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 69      ; 'E'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 84      ; 'T'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 73      ; 'I'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 114      ; 'r'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 48      ; '0'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 44
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 114      ; 'r'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 48      ; '0'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 44
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 114      ; 'r'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 50      ; '2'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 10
  STORE r12, r6
  ADD r12, r5
  LDI r6, 65      ; 'A'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 68      ; 'D'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 68      ; 'D'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 114      ; 'r'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 48      ; '0'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 44
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 114      ; 'r'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 10
  STORE r12, r6
  ADD r12, r5
  LDI r6, 67      ; 'C'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 77      ; 'M'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 80      ; 'P'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 114      ; 'r'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 48      ; '0'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 44
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 114      ; 'r'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 49      ; '1'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 50      ; '2'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 10
  STORE r12, r6
  ADD r12, r5
  LDI r6, 66      ; 'B'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 76      ; 'L'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 84      ; 'T'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 114      ; 'r'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 48      ; '0'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 44
  STORE r12, r6
  ADD r12, r5
  LDI r6, 32
  STORE r12, r6
  ADD r12, r5
  LDI r6, 108      ; 'l'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 111      ; 'o'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 111      ; 'o'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 112      ; 'p'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 10
  STORE r12, r6
  ADD r12, r5
  LDI r6, 72      ; 'H'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 65      ; 'A'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 76      ; 'L'
  STORE r12, r6
  ADD r12, r5
  LDI r6, 84      ; 'T'
  STORE r12, r6
  ADD r12, r5
  ; Null-terminate
  LDI r6, 0
  STORE r12, r6

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT