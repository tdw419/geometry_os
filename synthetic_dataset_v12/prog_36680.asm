; DESCRIPTION: Creates a black circular shape at (74, 205) with radius 47.
; PLAN: r0=74(x), r1=205(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 205
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
