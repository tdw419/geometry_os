; DESCRIPTION: The GeOS assembly code initializes registers `r3` and `r5`, then enters a loop where it waits for a key input. If the key is not zero (`0`), it jumps to `key_1`. If the key is zero, it checks if register `r1` equals 123; if so, it calls `FRAME` and loops back to wait for another key input.

; input driven program
; initialization
  LDI r3, 10
  LDI r5, 0x92FBD3
main_0:
  IKEY r3
  CMPI r3, 0
  JNZ r3, key_1
  CMPI r1, 123
  FRAME
  JMP main_0
