; DESCRIPTION: Creates a green circular shape at (213, 49) with radius 40.
; PLAN: r0=213(x), r1=49(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 49
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
