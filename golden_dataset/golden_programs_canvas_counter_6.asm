; DESCRIPTION: Display a object using color colored at the screen.

; canvas_counter.asm
; Increments a digit on the canvas grid each frame.
; Demonstrates that the grid IS the display.

  LDI r1, 0x8000    ; Top-left corner of canvas
  LDI r9, 0x30      ; ASCII '0'
  LDI r11, 1         ; Increment
  LDI r8, 0x3A      ; ASCII ':' (one past '9')

loop:
  STORE r1, r9      ; Update canvas
  FRAME             ; Wait for next frame
  ADD r9, r11        ; Increment character
  CMP r9, r8        ; Reached 10?
  BLT r3, loop      ; No, continue
  LDI r9, 0x30      ; Yes, reset to '0'
  JMP loop
