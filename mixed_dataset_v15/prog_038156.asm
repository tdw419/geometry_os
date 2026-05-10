; DESCRIPTION: Creates a black circular shape at (57, 55) with radius 54.
; PLAN: r0=57(x), r1=55(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 55
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
