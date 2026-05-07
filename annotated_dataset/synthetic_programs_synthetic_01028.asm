; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs arithmetic operations including addition, subtraction, multiplication, and division, uses conditional jumps based on register comparisons, draws rectangles and pixels on the screen using the RECTF and WPIXEL instructions, and calls a subroutine (func_3) that involves bitwise operations and returns. The main loop (main_4) continuously executes with bitwise shifts, logical operations, and frame updates until interrupted or halted.

; mixed program
; initialization
  LDI r8, 0xE6859E
  LDI r3, 32
  LDI r11, 2796
  LDI r2, 0x209385
  LDI r3, 0xA05BBE
  LDI r2, 0x1CF6C9
  LDI r8, 128
  PSETI
  CMP r8, r1
  PUSH r0
  PUSH r11
  PUSH r2
  PUSH r13
  DIV r27, r14, r1
  XOR r14, r6, r9
  MUL r11, r5, r6
  OR r1, r7, r5
  POP r13
  POP r2
  POP r11
  POP r0
  CMP r9, r14
  JNZ r9, else_0
  ADD r15, r11, r6
  SHR r3, r9, r10
  ADD r9, r15, r10
  JMP endif_1
else_0:
  LDI r25, 10
  LDI r14, 0xB3EC18
  LDI r9, 1980
  LDI r24, 0xC9EE3E
  LDI r6, 10
  RECTF r25, r14, r9, r24, r6
endif_1:
  PUSH r11
  PUSH r9
  PUSH r11
  PUSH r15
  OR r4, r9, r8
  SHR r0, r11, r12
  SUB r15, r13, r14
  POP r15
  POP r11
  POP r9
  POP r11
  LDI r9, 0xA9968D
loop_2:
  LDI r11, 10
  LDI r14, 3245
  LDI r4, 0x1FF51E
  WPIXEL
  SUB r7, r6, r10
  ADDI r2, r10, 8
  LDI r11, 1
  SUB r9, r9, r11
  JNZ r9, loop_2
  LDI r14, 0
  FILL r14
  CALL func_3
func_3:
  SHL r10, r2, r5
  AND r4, r10, r3
  ADD r14, r11, r12
  RET
main_4:
  ANDI r12, r2, 10
  SHLI r12, r15, 0x6E5A4E
  SHLI r5, r13, 10
  SHR r0, r15, r4
  XOR r5, r15, r3
  XOR r2, r13, r31
  AND r7, r0, r4
  FRAME
  JMP main_4
