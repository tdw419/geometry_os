; DESCRIPTION: Renders a purple disk with center (196, 95) and radius 56.
; PLAN: r0=196(x), r1=95(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 95
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
