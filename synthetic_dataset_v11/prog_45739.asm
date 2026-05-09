; DESCRIPTION: Creates a yellow circular shape at (190, 121) with radius 19.
; PLAN: r0=190(x), r1=121(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 121
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
