; DESCRIPTION: Composite: Creates a purple rectangular region at (40, 100) spanning 81 by 26 pixels then Places a green line segment connecting (310, 22) to (229, 232).
; PLAN: r0=40(x), r1=100(y), r2=81(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x1), r6=22(y1), r7=229(x2), r8=232(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 100
LDI r2, 81
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 22
LDI r7, 229
LDI r8, 232
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
