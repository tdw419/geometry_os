; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and calls a function named `func_0`. Within `func_0`, it performs arithmetic operations such as multiplication and subtraction. Depending on a comparison result, it either executes a series of bitwise operations or draws graphics primitives like points and circles using the PSET and CIRCLE instructions. The code also checks for a key press (specifically, if the key 'q' is pressed) and displays text "HELLO" at a specific location before halting execution.

; mixed program
; initialization
  LDI r11, 3387
  LDI r7, 16
  LDI r0, 64
  LDI r14, 2221
  CALL func_0
func_0:
  MUL r9, r13, r15
  SUB r14, r3, r4
  RET
  CMP r3, r0
  JNZ r3, else_1
  OR r3, r13, r5
  AND r9, r6, r5
  JMP endif_2
else_1:
  LDI r6, 1996
  LDI r13, 1102
  LDI r2, 64
  PSET r6, r13, r2
  LDI r19, 64
  LDI r10, 0xE13002
  LDI r10, 0xFE30CD
  LDI r15, 2754
  CIRCLE r19, r10, r10, r15
  LDI r14, 0x7A08C9
  LDI r1, 0x6588C5
  LDI r3, 4
  PSET r14, r1, r3
endif_2:
  IKEY r11
  CMPI r11, 25
  JNZ r11, key_3
  AND r4, r7, r1
  AND r2, r6, r10
  OR r6, r10, r0
  XOR r0, r10, r13
  LDI r4, 10
  LDI r10, 91
  LDI r7, 3399
  TEXT r4, r10, r7, "HELLO"
  OR r8, r15, r0
  AND r15, r1, r10
  HALT
