; DESCRIPTION: Renders a black disk with center (75, 99) and radius 42.
; PLAN: r0=75(x), r1=99(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 99
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
