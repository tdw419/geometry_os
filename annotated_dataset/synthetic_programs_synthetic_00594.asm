; DESCRIPTION: This GeOS assembly code performs a counted animation by repeatedly drawing and updating pixel patterns on the screen. It initializes various registers with specific values, then enters loops to decrement counters and fill pixels until certain conditions are met, ultimately halting execution.

; counted animation
; initialization
  LDI r9, 2858
  LDI r0, 0xEC509D
  LDI r11, 0xEE407C
  LDI r10, 16
  LDI r4, 0
loop_0:
  SUB r5, r1, r2
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_0
  LDI r7, 0
loop_1:
  LDI r6, 0x539D42
  FILL r6
  LDI r11, 214
  LDI r4, 605
  LDI r10, 2043
  PSETI
  LDI r4, 1
  SUB r7, r7, r4
  JNZ r7, loop_1
  HALT
