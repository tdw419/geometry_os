; DESCRIPTION: Render a colored object at the screen.

; canvas_counter.asm
; Increments a digit on the canvas grid each frame.
; Demonstrates that the grid IS the display.

  LDI r13, 0x8000    ; Top-left corner of canvas
  LDI r10, 0x30      ; ASCII '0'
  LDI r8, 1         ; Increment
  LDI r6, 0x3A      ; ASCII ':' (one past '9')

loop:
  STORE r13, r10      ; Update canvas
  FRAME             ; Wait for next frame
  ADD r10, r8        ; Increment character
  CMP r10, r6        ; Reached 10?
  BLT r1, loop      ; No, continue
  LDI r10, 0x30      ; Yes, reset to '0'
  JMP loop
