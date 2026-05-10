; DESCRIPTION: Creates a yellow circular shape at (190, 113) with radius 54.
; PLAN: r0=190(x), r1=113(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 113
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
