; DESCRIPTION: Creates a black circular shape at (213, 144) with radius 34.
; PLAN: r0=213(x), r1=144(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 144
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
