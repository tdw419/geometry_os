; DESCRIPTION: Render a colored object at the screen.

; canvas_counter.asm
; Increments a digit on the canvas grid each frame.
; Demonstrates that the grid IS the display.

  LDI r7, 0x8000    ; Top-left corner of canvas
  LDI r1, 0x30      ; ASCII '0'
  LDI r11, 1         ; Increment
  LDI r4, 0x3A      ; ASCII ':' (one past '9')

loop:
  STORE r7, r1      ; Update canvas
  FRAME             ; Wait for next frame
  ADD r1, r11        ; Increment character
  CMP r1, r4        ; Reached 10?
  BLT r15, loop      ; No, continue
  LDI r1, 0x30      ; Yes, reset to '0'
  JMP loop
