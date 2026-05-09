; DESCRIPTION: Composite: Places a purple line segment connecting (334, 40) to (34, 20) then Creates a orange rectangular region at (142, 2) spanning 64 by 104 pixels.
; PLAN: r0=334(x1), r1=40(y1), r2=34(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=2(y), r7=64(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 40
LDI r2, 34
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 2
LDI r7, 64
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
