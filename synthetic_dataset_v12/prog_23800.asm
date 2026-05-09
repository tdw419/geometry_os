; DESCRIPTION: Composite: Creates a black rectangular region at (121, 121) spanning 33 by 102 pixels then Places a orange line segment connecting (367, 19) to (334, 49).
; PLAN: r0=121(x), r1=121(y), r2=33(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x1), r6=19(y1), r7=334(x2), r8=49(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 121
LDI r2, 33
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 19
LDI r7, 334
LDI r8, 49
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
