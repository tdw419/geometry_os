; DESCRIPTION: Composite: Draws a purple circle centered at (419, 210) with radius 38 then Sets a single yellow pixel at (99, 98).
; PLAN: r0=419(x), r1=210(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x), r6=98(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 419
LDI r1, 210
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 98
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
