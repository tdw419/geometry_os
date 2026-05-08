; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and uses them to draw a pixel at a defined coordinate on the screen. It then fills a region starting from that point and halts execution.

; simple draw program
; initialization
  LDI r12, 2
  LDI r7, 255
  LDI r3, 0x88283D
  LDI r14, 0x556716
  LDI r2, 2576
  LDI r10, 3318
  LDI r5, 2219
  LDI r1, 515
  LDI r6, 0xF782DC
  LDI r2, 1455
  LDI r9, 0x8120BA
  WPIXEL
  LDI r0, 200
  FILL r0
  HALT
