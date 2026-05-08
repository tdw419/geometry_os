; DESCRIPTION: This GeOS assembly code writes a self-modifying program to the canvas buffer at address 0x8000 that generates a rainbow diagonal pattern. The code then assembles and executes this program, resulting in a visual display on the canvas.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r12, 0x8000    ; canvas buffer start
  LDI r9, 1         ; increment
  LDI r13, 76      ; 'L'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 68      ; 'D'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 73      ; 'I'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 114      ; 'r'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 48      ; '0'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 44
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 48      ; '0'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 10
  STORE r12, r13
  ADD r12, r9
  LDI r13, 76      ; 'L'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 68      ; 'D'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 73      ; 'I'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 114      ; 'r'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 44
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 10
  STORE r12, r13
  ADD r12, r9
  LDI r13, 76      ; 'L'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 68      ; 'D'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 73      ; 'I'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 114      ; 'r'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 50      ; '2'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 44
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 50      ; '2'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 53      ; '5'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 54      ; '6'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 10
  STORE r12, r13
  ADD r12, r9
  LDI r13, 108      ; 'l'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 111      ; 'o'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 111      ; 'o'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 112      ; 'p'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 58
  STORE r12, r13
  ADD r12, r9
  LDI r13, 10
  STORE r12, r13
  ADD r12, r9
  LDI r13, 80      ; 'P'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 83      ; 'S'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 69      ; 'E'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 84      ; 'T'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 73      ; 'I'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 114      ; 'r'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 48      ; '0'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 44
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 114      ; 'r'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 48      ; '0'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 44
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 114      ; 'r'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 50      ; '2'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 10
  STORE r12, r13
  ADD r12, r9
  LDI r13, 65      ; 'A'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 68      ; 'D'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 68      ; 'D'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 114      ; 'r'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 48      ; '0'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 44
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 114      ; 'r'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 10
  STORE r12, r13
  ADD r12, r9
  LDI r13, 67      ; 'C'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 77      ; 'M'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 80      ; 'P'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 114      ; 'r'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 48      ; '0'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 44
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 114      ; 'r'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 49      ; '1'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 50      ; '2'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 10
  STORE r12, r13
  ADD r12, r9
  LDI r13, 66      ; 'B'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 76      ; 'L'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 84      ; 'T'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 114      ; 'r'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 48      ; '0'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 44
  STORE r12, r13
  ADD r12, r9
  LDI r13, 32
  STORE r12, r13
  ADD r12, r9
  LDI r13, 108      ; 'l'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 111      ; 'o'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 111      ; 'o'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 112      ; 'p'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 10
  STORE r12, r13
  ADD r12, r9
  LDI r13, 72      ; 'H'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 65      ; 'A'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 76      ; 'L'
  STORE r12, r13
  ADD r12, r9
  LDI r13, 84      ; 'T'
  STORE r12, r13
  ADD r12, r9
  ; Null-terminate
  LDI r13, 0
  STORE r12, r13

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT