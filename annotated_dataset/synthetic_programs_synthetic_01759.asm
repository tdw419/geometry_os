; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a drawing loop where it repeatedly draws the text "HELLO" and "WORLD" at different positions on the screen. The program uses the `TEXT` and `DRAWTEXT` instructions to render the strings and then calls `FRAME` to update the display, before jumping back to the start of the loop with `JMP main_0`.

; drawing loop program
; initialization
  LDI r13, 2268
  LDI r12, 256
  LDI r10, 64
  LDI r20, 2309
main_0:
  LDI r31, 2651
  LDI r28, 256
  LDI r4, 128
  TEXT r31, r28, r4, "HELLO"
  ADD r10, r8, r3
  ADDI r13, r14, 255
  CMPI r2, r11, 8
  LDI r4, 255
  LDI r2, 893
  LDI r9, 3118
  DRAWTEXT r4, r2, r9, "WORLD"
  FRAME
  JMP main_0
