; DESCRIPTION: Creates a green circular shape at (167, 37) with radius 18.
; PLAN: r0=167(x), r1=37(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 37
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
