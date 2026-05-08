; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters a loop where it performs bitwise operations and arithmetic on these registers. The loop decrements a counter and calls `func_1` when the counter reaches zero. `func_1` performs additional bitwise and arithmetic operations, then writes a pixel to the screen using `WPIXEL` before halting the program.

; mixed program
; initialization
  LDI r7, 32
  LDI r9, 0
  LDI r11, 1299
  LDI r14, 1328
  LDI r13, 0x7ED475
  LDI r12, 128
loop_0:
  AND r14, r13, r20
  ADDI r2, r5, 8
  SHL r4, r5, r3
  AND r2, r11, r8
  LDI r11, 1
  SUB r12, r12, r11
  JNZ r12, loop_0
  CALL func_1
func_1:
  XOR r8, r11, r13
  ADD r9, r12, r4
  SHR r11, r13, r15
  OR r15, r9, r5
  RET
  LDI r10, 1399
  LDI r6, 128
  LDI r5, 3795
  WPIXEL
  HALT
