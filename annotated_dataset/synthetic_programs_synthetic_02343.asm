; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it waits for key inputs. If the first key input matches a certain value (16), it performs shift operations on registers. Upon receiving another specific key input (217), it sets pixel coordinates and color, then draws a point on the screen before repeating the loop.

; drawing loop program
; initialization
  LDI r5, 0x7C415B
  LDI r2, 0xBA2EFA
  LDI r11, 2029
main_0:
  IKEY r12
  CMPI r12, 16
  JNZ r12, key_1
  SAR r10, r5, r12
  SHR r6, r13, r1
  IKEY r15
  CMPI r15, 217
  JNZ r15, key_2
  LDI r10, 256
  LDI r7, 0x5DC7D2
  LDI r6, 64
  PSET r10, r7, r6
  FRAME
  JMP main_0
