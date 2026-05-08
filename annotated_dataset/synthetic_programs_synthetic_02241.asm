; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop that waits for input. It checks two input keys; if the first key matches a specific value, it checks a second key. If both conditions are met, it calls a `FRAME` function and loops back to wait for further inputs.

; input driven program
; initialization
  LDI r1, 0x7C0BA6
  LDI r10, 0x048549
  LDI r11, 2412
  LDI r0, 1
  LDI r9, 4
  LDI r5, 0xBD3DC4
  LDI r7, 0xF3B7D3
  LDI r15, 8
main_0:
  ANDI r1, r12, 198
  IKEY r11
  CMPI r11, 218
  JNZ r11, key_1
  IKEY r10
  CMPI r10, 0xD6E522
  JNZ r10, key_2
  FRAME
  JMP main_0
