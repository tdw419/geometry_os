; DESCRIPTION: Creates a green circular shape at (132, 39) with radius 34.
; PLAN: r0=132(x), r1=39(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 39
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
