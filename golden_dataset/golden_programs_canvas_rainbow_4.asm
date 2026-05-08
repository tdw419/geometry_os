; DESCRIPTION: This GeOS assembly code writes a self-modifying program to the canvas buffer at address 0x8000 that generates a rainbow diagonal pattern. The code then assembles and executes this program, resulting in a visual display on the canvas.

; canvas_rainbow.asm
; Self-modifying demo - writes a rainbow diagonal generator to canvas
; Writes a program to the canvas at 0x8000, then ASMSELF+RUNNEXT.

  LDI r3, 0x8000    ; canvas buffer start
  LDI r0, 1         ; increment
  LDI r14, 76      ; 'L'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 68      ; 'D'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 73      ; 'I'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 114      ; 'r'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 48      ; '0'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 44
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 48      ; '0'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 10
  STORE r3, r14
  ADD r3, r0
  LDI r14, 76      ; 'L'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 68      ; 'D'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 73      ; 'I'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 114      ; 'r'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 44
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 10
  STORE r3, r14
  ADD r3, r0
  LDI r14, 76      ; 'L'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 68      ; 'D'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 73      ; 'I'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 114      ; 'r'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 50      ; '2'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 44
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 50      ; '2'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 53      ; '5'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 54      ; '6'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 10
  STORE r3, r14
  ADD r3, r0
  LDI r14, 108      ; 'l'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 111      ; 'o'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 111      ; 'o'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 112      ; 'p'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 58
  STORE r3, r14
  ADD r3, r0
  LDI r14, 10
  STORE r3, r14
  ADD r3, r0
  LDI r14, 80      ; 'P'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 83      ; 'S'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 69      ; 'E'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 84      ; 'T'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 73      ; 'I'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 114      ; 'r'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 48      ; '0'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 44
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 114      ; 'r'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 48      ; '0'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 44
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 114      ; 'r'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 50      ; '2'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 10
  STORE r3, r14
  ADD r3, r0
  LDI r14, 65      ; 'A'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 68      ; 'D'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 68      ; 'D'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 114      ; 'r'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 48      ; '0'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 44
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 114      ; 'r'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 10
  STORE r3, r14
  ADD r3, r0
  LDI r14, 67      ; 'C'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 77      ; 'M'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 80      ; 'P'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 114      ; 'r'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 48      ; '0'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 44
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 114      ; 'r'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 49      ; '1'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 50      ; '2'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 10
  STORE r3, r14
  ADD r3, r0
  LDI r14, 66      ; 'B'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 76      ; 'L'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 84      ; 'T'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 114      ; 'r'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 48      ; '0'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 44
  STORE r3, r14
  ADD r3, r0
  LDI r14, 32
  STORE r3, r14
  ADD r3, r0
  LDI r14, 108      ; 'l'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 111      ; 'o'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 111      ; 'o'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 112      ; 'p'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 10
  STORE r3, r14
  ADD r3, r0
  LDI r14, 72      ; 'H'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 65      ; 'A'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 76      ; 'L'
  STORE r3, r14
  ADD r3, r0
  LDI r14, 84      ; 'T'
  STORE r3, r14
  ADD r3, r0
  ; Null-terminate
  LDI r14, 0
  STORE r3, r14

  ; Assemble the canvas text and run it
  ASMSELF
  RUNNEXT