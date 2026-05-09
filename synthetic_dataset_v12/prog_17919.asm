; DESCRIPTION: Renders a black disk with center (283, 42) and radius 38.
; PLAN: r0=283(x), r1=42(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 42
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
