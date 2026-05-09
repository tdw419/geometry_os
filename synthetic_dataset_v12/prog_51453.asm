; DESCRIPTION: Composite: Creates a purple circular shape at (72, 78) with radius 38 then Places a orange dot at position (169, 6).
; PLAN: r0=72(x), r1=78(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x), r6=6(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 78
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 6
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
