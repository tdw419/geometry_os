; DESCRIPTION: Creates a white circular shape at (136, 160) with radius 48.
; PLAN: r0=136(x), r1=160(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 160
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
