; DESCRIPTION: Creates a black circular shape at (90, 154) with radius 24.
; PLAN: r0=90(x), r1=154(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 154
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
