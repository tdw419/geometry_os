; DESCRIPTION: Creates a green circular shape at (187, 64) with radius 57.
; PLAN: r0=187(x), r1=64(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 64
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
