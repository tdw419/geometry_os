; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it draws rectangles on the screen using the `RECTF` instruction. It also checks for keyboard input to modify its behavior based on certain key presses, specifically keys with ASCII values of 64 and 191, and potentially compares register `r28` with `r13` to trigger a `FRAME` command before repeating the loop.

; drawing loop program
; initialization
  LDI r2, 0x556998
  LDI r3, 1344
  LDI r28, 0xC4B7C5
  LDI r6, 255
main_0:
  LDI r3, 0x3F73A0
  LDI r21, 2
  LDI r6, 0xD43585
  LDI r9, 0x80972A
  LDI r7, 3114
  RECTF r3, r21, r6, r9, r7
  IKEY r6
  CMPI r6, 64
  JNZ r6, key_1
  ANDI r6, r14, 223
  IKEY r0
  CMPI r0, 191
  JNZ r0, key_2
  CMP r28, r13
  FRAME
  JMP main_0
