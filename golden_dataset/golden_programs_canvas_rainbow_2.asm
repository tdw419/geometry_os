; DESCRIPTION: This GeOS assembly code writes a self-modifying program to the canvas buffer at address 0x8000 that generates a rainbow diagonal pattern. The code then assembles and executes this program, resulting in a visual display on the canvas.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r3, 0x8000    ; canvas buffer start
  LDI r12, 1         ; increment
  LDI r9, 76      ; 'L'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 68      ; 'D'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 73      ; 'I'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 114      ; 'r'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 48      ; '0'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 44
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 48      ; '0'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 10
  STORE r3, r9
  ADD r3, r12
  LDI r9, 76      ; 'L'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 68      ; 'D'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 73      ; 'I'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 114      ; 'r'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 44
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 10
  STORE r3, r9
  ADD r3, r12
  LDI r9, 76      ; 'L'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 68      ; 'D'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 73      ; 'I'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 114      ; 'r'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 50      ; '2'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 44
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 50      ; '2'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 53      ; '5'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 54      ; '6'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 10
  STORE r3, r9
  ADD r3, r12
  LDI r9, 108      ; 'l'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 111      ; 'o'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 111      ; 'o'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 112      ; 'p'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 58
  STORE r3, r9
  ADD r3, r12
  LDI r9, 10
  STORE r3, r9
  ADD r3, r12
  LDI r9, 80      ; 'P'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 83      ; 'S'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 69      ; 'E'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 84      ; 'T'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 73      ; 'I'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 114      ; 'r'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 48      ; '0'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 44
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 114      ; 'r'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 48      ; '0'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 44
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 114      ; 'r'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 50      ; '2'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 10
  STORE r3, r9
  ADD r3, r12
  LDI r9, 65      ; 'A'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 68      ; 'D'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 68      ; 'D'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 114      ; 'r'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 48      ; '0'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 44
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 114      ; 'r'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 10
  STORE r3, r9
  ADD r3, r12
  LDI r9, 67      ; 'C'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 77      ; 'M'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 80      ; 'P'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 114      ; 'r'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 48      ; '0'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 44
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 114      ; 'r'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 49      ; '1'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 50      ; '2'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 10
  STORE r3, r9
  ADD r3, r12
  LDI r9, 66      ; 'B'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 76      ; 'L'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 84      ; 'T'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 114      ; 'r'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 48      ; '0'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 44
  STORE r3, r9
  ADD r3, r12
  LDI r9, 32
  STORE r3, r9
  ADD r3, r12
  LDI r9, 108      ; 'l'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 111      ; 'o'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 111      ; 'o'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 112      ; 'p'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 10
  STORE r3, r9
  ADD r3, r12
  LDI r9, 72      ; 'H'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 65      ; 'A'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 76      ; 'L'
  STORE r3, r9
  ADD r3, r12
  LDI r9, 84      ; 'T'
  STORE r3, r9
  ADD r3, r12
  ; Null-terminate
  LDI r9, 0
  STORE r3, r9

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT