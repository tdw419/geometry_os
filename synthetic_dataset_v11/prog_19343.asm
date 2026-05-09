; DESCRIPTION: Creates a green circular shape at (64, 207) with radius 48.
; PLAN: r0=64(x), r1=207(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 207
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
