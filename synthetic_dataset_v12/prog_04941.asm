; DESCRIPTION: Creates a green circular shape at (330, 73) with radius 49.
; PLAN: r0=330(x), r1=73(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 73
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
