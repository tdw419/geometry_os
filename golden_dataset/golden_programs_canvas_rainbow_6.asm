; DESCRIPTION: This GeOS assembly code writes a self-modifying program to the canvas buffer at address 0x8000 that generates a rainbow diagonal pattern. The code then assembles and executes this program, resulting in a visual display on the canvas.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r10, 0x8000    ; canvas buffer start
  LDI r1, 1         ; increment
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 44
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 10
  STORE r10, r2
  ADD r10, r1
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 44
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 10
  STORE r10, r2
  ADD r10, r1
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 44
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 53      ; '5'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 54      ; '6'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 10
  STORE r10, r2
  ADD r10, r1
  LDI r2, 108      ; 'l'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 111      ; 'o'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 111      ; 'o'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 112      ; 'p'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 58
  STORE r10, r2
  ADD r10, r1
  LDI r2, 10
  STORE r10, r2
  ADD r10, r1
  LDI r2, 80      ; 'P'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 83      ; 'S'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 69      ; 'E'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 73      ; 'I'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 44
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 44
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 10
  STORE r10, r2
  ADD r10, r1
  LDI r2, 65      ; 'A'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 68      ; 'D'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 44
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 10
  STORE r10, r2
  ADD r10, r1
  LDI r2, 67      ; 'C'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 77      ; 'M'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 80      ; 'P'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 44
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 49      ; '1'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 50      ; '2'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 10
  STORE r10, r2
  ADD r10, r1
  LDI r2, 66      ; 'B'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 114      ; 'r'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 48      ; '0'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 44
  STORE r10, r2
  ADD r10, r1
  LDI r2, 32
  STORE r10, r2
  ADD r10, r1
  LDI r2, 108      ; 'l'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 111      ; 'o'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 111      ; 'o'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 112      ; 'p'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 10
  STORE r10, r2
  ADD r10, r1
  LDI r2, 72      ; 'H'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 65      ; 'A'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 76      ; 'L'
  STORE r10, r2
  ADD r10, r1
  LDI r2, 84      ; 'T'
  STORE r10, r2
  ADD r10, r1
  ; Null-terminate
  LDI r2, 0
  STORE r10, r2

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT