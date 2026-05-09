; DESCRIPTION: Composite: Places a orange line segment connecting (305, 121) to (411, 1) then Sets a single white pixel at (272, 203) then Places a cyan 79x79 rectangle at position (67, 36).
; PLAN: r0=305(x1), r1=121(y1), r2=411(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=203(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=67(x), r11=36(y), r12=79(width), r13=79(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 121
LDI r2, 411
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 203
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 67
LDI r11, 36
LDI r12, 79
LDI r13, 79
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
