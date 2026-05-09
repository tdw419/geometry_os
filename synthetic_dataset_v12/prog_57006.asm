; DESCRIPTION: Creates a yellow circular shape at (349, 185) with radius 57.
; PLAN: r0=349(x), r1=185(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 185
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
