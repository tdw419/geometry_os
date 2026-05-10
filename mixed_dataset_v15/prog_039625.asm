; DESCRIPTION: Renders a yellow disk with center (157, 123) and radius 42.
; PLAN: r0=157(x), r1=123(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 123
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
