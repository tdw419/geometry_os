; DESCRIPTION: Renders a black disk with center (55, 128) and radius 42.
; PLAN: r0=55(x), r1=128(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 128
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
