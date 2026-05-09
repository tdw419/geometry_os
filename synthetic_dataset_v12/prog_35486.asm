; DESCRIPTION: Creates a black circular shape at (190, 111) with radius 36.
; PLAN: r0=190(x), r1=111(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 111
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
