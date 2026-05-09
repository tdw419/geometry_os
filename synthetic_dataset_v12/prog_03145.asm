; DESCRIPTION: Composite: Creates a white rectangular region at (200, 41) spanning 28 by 25 pixels then Places a black line segment connecting (258, 246) to (282, 49).
; PLAN: r0=200(x), r1=41(y), r2=28(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x1), r6=246(y1), r7=282(x2), r8=49(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 41
LDI r2, 28
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 246
LDI r7, 282
LDI r8, 49
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
