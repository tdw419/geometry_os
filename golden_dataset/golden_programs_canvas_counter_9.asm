; DESCRIPTION: This GeOS assembly code increments a digit displayed on the canvas grid each frame. The digit resets after reaching '9', demonstrating that the grid functions as both the display and storage medium.

; canvas_counter.asm
; Increments a digit on the canvas grid each frame.
; Demonstrates that the grid IS the display.

  LDI r11, 0x8000    ; Top-left corner of canvas
  LDI r6, 0x30      ; ASCII '0'
  LDI r0, 1         ; Increment
  LDI r15, 0x3A      ; ASCII ':' (one past '9')

loop:
  STORE r11, r6      ; Update canvas
  FRAME             ; Wait for next frame
  ADD r6, r0        ; Increment character
  CMP r6, r15        ; Reached 10?
  BLT r13, loop      ; No, continue
  LDI r6, 0x30      ; Yes, reset to '0'
  JMP loop
