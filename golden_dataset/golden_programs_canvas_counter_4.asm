; DESCRIPTION: Geometry OS program to draw a colored object.

; canvas_counter.asm
; Increments a digit on the canvas grid each frame.
; Demonstrates that the grid IS the display.

  LDI r3, 0x8000    ; Top-left corner of canvas
  LDI r14, 0x30      ; ASCII '0'
  LDI r11, 1         ; Increment
  LDI r5, 0x3A      ; ASCII ':' (one past '9')

loop:
  STORE r3, r14      ; Update canvas
  FRAME             ; Wait for next frame
  ADD r14, r11        ; Increment character
  CMP r14, r5        ; Reached 10?
  BLT r13, loop      ; No, continue
  LDI r14, 0x30      ; Yes, reset to '0'
  JMP loop
