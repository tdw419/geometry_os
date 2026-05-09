; DESCRIPTION: Creates a yellow circular shape at (190, 145) with radius 55.
; PLAN: r0=190(x), r1=145(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 145
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
