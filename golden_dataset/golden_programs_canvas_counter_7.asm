; DESCRIPTION: Render a colored object at the screen.

; canvas_counter.asm
; Increments a digit on the canvas grid each frame.
; Demonstrates that the grid IS the display.

  LDI r11, 0x8000    ; Top-left corner of canvas
  LDI r5, 0x30      ; ASCII '0'
  LDI r2, 1         ; Increment
  LDI r14, 0x3A      ; ASCII ':' (one past '9')

loop:
  STORE r11, r5      ; Update canvas
  FRAME             ; Wait for next frame
  ADD r5, r2        ; Increment character
  CMP r5, r14        ; Reached 10?
  BLT r6, loop      ; No, continue
  LDI r5, 0x30      ; Yes, reset to '0'
  JMP loop
