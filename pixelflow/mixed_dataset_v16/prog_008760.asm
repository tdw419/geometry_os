; DESCRIPTION: Creates a black circular shape at (410, 119) with radius 63.
; PLAN: r0=410(x), r1=119(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 119
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
