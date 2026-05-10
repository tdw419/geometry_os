; DESCRIPTION: Renders a purple circular shape at (42, 51) with radius 37.
; PLAN: r0=42(x), r1=51(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 51
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
