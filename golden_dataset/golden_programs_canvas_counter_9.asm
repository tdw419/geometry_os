; DESCRIPTION: A colored object centered at the screen with fixed size.

; canvas_counter.asm
; Increments a digit on the canvas grid each frame.
; Demonstrates that the grid IS the display.

  LDI r2, 0x8000    ; Top-left corner of canvas
  LDI r5, 0x30      ; ASCII '0'
  LDI r8, 1         ; Increment
  LDI r7, 0x3A      ; ASCII ':' (one past '9')

loop:
  STORE r2, r5      ; Update canvas
  FRAME             ; Wait for next frame
  ADD r5, r8        ; Increment character
  CMP r5, r7        ; Reached 10?
  BLT r0, loop      ; No, continue
  LDI r5, 0x30      ; Yes, reset to '0'
  JMP loop
