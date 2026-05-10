; DESCRIPTION: Renders a black disk with center (133, 42) and radius 27.
; PLAN: r0=133(x), r1=42(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 42
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
