; DESCRIPTION: This GeOS assembly code increments a digit displayed on the canvas grid each frame. The digit resets after reaching '9', demonstrating that the grid functions as both the display and storage medium.

; canvas_counter.asm
; Increments a digit on the canvas grid each frame.
; Demonstrates that the grid IS the display.

  LDI r10, 0x8000    ; Top-left corner of canvas
  LDI r13, 0x30      ; ASCII '0'
  LDI r2, 1         ; Increment
  LDI r1, 0x3A      ; ASCII ':' (one past '9')

loop:
  STORE r10, r13      ; Update canvas
  FRAME             ; Wait for next frame
  ADD r13, r2        ; Increment character
  CMP r13, r1        ; Reached 10?
  BLT r8, loop      ; No, continue
  LDI r13, 0x30      ; Yes, reset to '0'
  JMP loop
