; DESCRIPTION: Display a object using color colored at the screen.

; self_writer.asm
; A program that writes a NEW program to the canvas, compiles it, and runs it.
; Generation 1: Writes "LDI r0, 42 \n HALT" to canvas.
; Successor: Sets r0 to 42 and halts.

  LDI r0, 0x8000    ; Start of canvas RAM
  LDI r11, 1         ; Increment
  
  ; Write "LDI r0, 42" to canvas
  LDI r7, 0x4C      ; 'L'
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x44      ; 'D'
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x49      ; 'I'
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x20      ; ' '
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x72      ; 'r'
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x31      ; '1'
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x2C      ; ','
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x20      ; ' '
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x34      ; '4'
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x32      ; '2'
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x0A      ; '\n'
  STORE r0, r7
  ADD r0, r11
  
  ; Write "HALT"
  LDI r7, 0x48      ; 'H'
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x41      ; 'A'
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x4C      ; 'L'
  STORE r0, r7
  ADD r0, r11
  LDI r7, 0x54      ; 'T'
  STORE r0, r7
  ADD r0, r11
  
  ; Null-terminate
  LDI r7, 0
  STORE r0, r7

  ; Assemble the canvas text
  ASMSELF
  
  ; Run the newly assembled code at 0x1000
  RUNNEXT
