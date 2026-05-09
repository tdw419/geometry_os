; DESCRIPTION: Renders a blue disk with center (129, 42) and radius 29.
; PLAN: r0=129(x), r1=42(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 42
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
