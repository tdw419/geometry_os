; DESCRIPTION: Composite: Places a red line segment connecting (119, 95) to (316, 239) then Creates a cyan circular shape at (78, 170) with radius 66 then Places a green 65x72 rectangle at position (102, 157).
; PLAN: r0=119(x1), r1=95(y1), r2=316(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=170(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=102(x), r11=157(y), r12=65(width), r13=72(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 95
LDI r2, 316
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 170
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 102
LDI r11, 157
LDI r12, 65
LDI r13, 72
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
