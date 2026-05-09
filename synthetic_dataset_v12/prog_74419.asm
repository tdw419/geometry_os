; DESCRIPTION: Renders a purple disk with center (196, 159) and radius 62.
; PLAN: r0=196(x), r1=159(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 159
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
