; DESCRIPTION: The provided GeOS assembly code initializes several registers with specific values and sets up a loop that performs bitwise operations, arithmetic calculations, and graphical drawing functions such as rectangles and circles. The program also handles keyboard input to perform conditional branching and draw text on the screen.

; mixed program
; initialization
  LDI r14, 1
  LDI r5, 0x1B3CAC
  LDI r13, 746
  LDI r3, 3031
  LDI r6, 128
  LDI r15, 1529
  LDI r8, 0x8031A5
  LDI r5, 64
  PSETI
  LDI r0, 255
loop_0:
  ANDI r6, r4, 0x02BF75
  SHL r3, r5, r2
  LDI r8, 0
  LDI r0, 10
  LDI r11, 1
  LDI r11, 4
  LDI r0, 1
  RECTF r8, r0, r11, r11, r0
  ANDI r0, r8, 32
  LDI r5, 1
  SUB r0, r0, r5
  JNZ r0, loop_0
  IKEY r9
  CMPI r9, 8
  JNZ r9, key_1
  CMP r1, r9
  JNZ r1, else_2
  SHL r14, r8, r2
  XOR r1, r2, r12
  SHR r8, r10, r11
  JMP endif_3
else_2:
  LDI r6, 2240
  LDI r2, 128
  LDI r11, 0xF7C0BC
  LDI r13, 0
  CIRCLE r6, r2, r11, r13
endif_3:
main_4:
  LDI r13, 0
  LDI r3, 16
  LDI r11, 3023
  DRAWTEXT r13, r3, r11, "WORLD"
  OR r14, r8, r12
  OR r4, r14, r10
  OR r4, r3, r6
  XOR r7, r14, r4
  LDI r8, 0
  LDI r0, 0xBB3E99
  LDI r13, 128
  DRAWTEXT r8, r0, r13, "WORLD"
  SHLI r14, r0, 255
  SAR r15, r25, r4
  SHL r1, r9, r3
  FRAME
  JMP main_4
