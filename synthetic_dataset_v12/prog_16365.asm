; DESCRIPTION: Creates a black circular shape at (99, 186) with radius 34.
; PLAN: r0=99(x), r1=186(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 186
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
