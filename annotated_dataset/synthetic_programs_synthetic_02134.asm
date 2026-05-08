; DESCRIPTION: The GeOS assembly code initializes several registers and enters a loop where it shifts bits of the value in register `r13` into `r4`, divides `r4` by `r12`, waits for a key press, and if the key is not zero (`JNZ r5, key_1`), calls the `FRAME` routine and then loops back to `main_0`.

; input driven program
; initialization
  LDI r11, 16
  LDI r22, 4083
  LDI r2, 16
  LDI r8, 1
  LDI r0, 128
  LDI r13, 3692
main_0:
  SHL r8, r13, r4
  DIV r4, r12, r2
  IKEY r5
  CMPI r5, 0
  JNZ r5, key_1
  FRAME
  JMP main_0
