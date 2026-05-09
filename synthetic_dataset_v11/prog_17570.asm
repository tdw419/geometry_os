; DESCRIPTION: Renders a blue disk with center (101, 51) and radius 42.
; PLAN: r0=101(x), r1=51(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 51
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
