; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a counted loop (`loop_0`) where it writes pixels to the screen using the `WPIXEL` instruction and performs bit manipulation operations. After completing the first loop, it enters another counted loop (`loop_1`) that involves multiplying and adding register values before eventually halting execution.

; counted animation
; initialization
  LDI r5, 3858
  LDI r2, 399
  LDI r0, 3303
  LDI r4, 0xA405F6
  LDI r8, 0x9CB7D3
  LDI r10, 17
loop_0:
  LDI r0, 8
  LDI r31, 0x726C1B
  LDI r10, 567
  WPIXEL
  LDI r6, 2369
  FILL r6
  CMPI r2, r12, 2
  SHL r12, r4, r9
  LDI r3, 1
  SUB r10, r10, r3
  JNZ r10, loop_0
  LDI r13, 15
loop_1:
  MUL r8, r7, r5
  ADDI r12, r6, 60
  ADD r12, r6, r7
  ANDI r30, r0, 0x567805
  LDI r11, 1
  SUB r13, r13, r11
  JNZ r13, loop_1
  HALT
