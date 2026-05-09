; DESCRIPTION: Creates a black circular shape at (187, 106) with radius 54.
; PLAN: r0=187(x), r1=106(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 106
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
