; DESCRIPTION: This GeOS assembly code writes a self-modifying program to the canvas buffer at address 0x8000 that generates a rainbow diagonal pattern. The code then assembles and executes this program, resulting in a visual display on the canvas.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r6, 0x8000    ; canvas buffer start
  LDI r4, 1         ; increment
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 44
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 10
  STORE r6, r10
  ADD r6, r4
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 44
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 10
  STORE r6, r10
  ADD r6, r4
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 44
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 53      ; '5'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 54      ; '6'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 10
  STORE r6, r10
  ADD r6, r4
  LDI r10, 108      ; 'l'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 111      ; 'o'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 111      ; 'o'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 112      ; 'p'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 58
  STORE r6, r10
  ADD r6, r4
  LDI r10, 10
  STORE r6, r10
  ADD r6, r4
  LDI r10, 80      ; 'P'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 83      ; 'S'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 69      ; 'E'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 73      ; 'I'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 44
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 44
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 10
  STORE r6, r10
  ADD r6, r4
  LDI r10, 65      ; 'A'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 68      ; 'D'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 44
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 10
  STORE r6, r10
  ADD r6, r4
  LDI r10, 67      ; 'C'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 77      ; 'M'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 80      ; 'P'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 44
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 49      ; '1'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 50      ; '2'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 10
  STORE r6, r10
  ADD r6, r4
  LDI r10, 66      ; 'B'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 114      ; 'r'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 48      ; '0'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 44
  STORE r6, r10
  ADD r6, r4
  LDI r10, 32
  STORE r6, r10
  ADD r6, r4
  LDI r10, 108      ; 'l'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 111      ; 'o'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 111      ; 'o'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 112      ; 'p'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 10
  STORE r6, r10
  ADD r6, r4
  LDI r10, 72      ; 'H'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 65      ; 'A'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 76      ; 'L'
  STORE r6, r10
  ADD r6, r4
  LDI r10, 84      ; 'T'
  STORE r6, r10
  ADD r6, r4
  ; Null-terminate
  LDI r10, 0
  STORE r6, r10

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT