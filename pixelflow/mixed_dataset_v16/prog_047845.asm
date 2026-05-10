; DESCRIPTION: Composite: Creates a orange rectangular region at (287, 53) spanning 52 by 21 pixels then Sets a single white pixel at (216, 218).
; PLAN: r0=287(x), r1=53(y), r2=52(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x), r6=218(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 287
LDI r1, 53
LDI r2, 52
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 218
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
