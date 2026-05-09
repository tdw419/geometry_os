; DESCRIPTION: Creates a green circular shape at (74, 54) with radius 21.
; PLAN: r0=74(x), r1=54(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 54
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
