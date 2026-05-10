; DESCRIPTION: Composite: Places a red line segment connecting (304, 131) to (388, 115) then Sets a single yellow pixel at (510, 255) then Places a cyan 25x51 rectangle at position (207, 178).
; PLAN: r0=304(x1), r1=131(y1), r2=388(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=510(x), r6=255(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=207(x), r11=178(y), r12=25(width), r13=51(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 131
LDI r2, 388
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 255
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 207
LDI r11, 178
LDI r12, 25
LDI r13, 51
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
