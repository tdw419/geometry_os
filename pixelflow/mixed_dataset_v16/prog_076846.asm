; DESCRIPTION: Composite: Creates a orange rectangular region at (94, 38) spanning 73 by 110 pixels then Places a orange circle of radius 66 at center (351, 133).
; PLAN: r0=94(x), r1=38(y), r2=73(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x), r6=133(y), r7=66(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 38
LDI r2, 73
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 133
LDI r7, 66
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
