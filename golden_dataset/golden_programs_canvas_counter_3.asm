; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; canvas_counter.asm
; Increments a digit on the canvas grid each frame.
; Demonstrates that the grid IS the display.

  LDI r8, 0x8000    ; Top-left corner of canvas
  LDI r6, 0x30      ; ASCII '0'
  LDI r0, 1         ; Increment
  LDI r13, 0x3A      ; ASCII ':' (one past '9')

loop:
  STORE r8, r6      ; Update canvas
  FRAME             ; Wait for next frame
  ADD r6, r0        ; Increment character
  CMP r6, r13        ; Reached 10?
  BLT r9, loop      ; No, continue
  LDI r6, 0x30      ; Yes, reset to '0'
  JMP loop
