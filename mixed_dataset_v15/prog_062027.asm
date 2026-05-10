; DESCRIPTION: Renders a white circular shape at (64, 23) with radius 36.
; PLAN: r0=64(x), r1=23(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 23
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
