; DESCRIPTION: This GeOS assembly code writes the string "LDI r11, 42 \n HALT" to a designated area in RAM (canvas), assembles it into executable machine code using the `ASMSELF` instruction, and then runs the newly assembled program at address 0x1000.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r11, 42 \n HALT" to canvas.
; Successor: Sets r11 to 42 and halts.

  LDI r11, 0x8000    ; Start of canvas RAM
  LDI r10, 1         ; Increment
  
  ; Write "LDI r11, 42" to canvas
  LDI r14, 0x4C      ; 'L'
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x44      ; 'D'
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x49      ; 'I'
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x20      ; ' '
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x72      ; 'r'
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x31      ; '1'
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x2C      ; ','
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x20      ; ' '
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x34      ; '4'
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x32      ; '2'
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x0A      ; '\n'
  STORE r11, r14
  ADD r11, r10
  
  ; Write "HALT"
  LDI r14, 0x48      ; 'H'
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x41      ; 'A'
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x4C      ; 'L'
  STORE r11, r14
  ADD r11, r10
  LDI r14, 0x54      ; 'T'
  STORE r11, r14
  ADD r11, r10
  
  ; Null-terminate
  LDI r14, 0
  STORE r11, r14

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
