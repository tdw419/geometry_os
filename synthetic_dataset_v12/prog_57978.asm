; DESCRIPTION: Renders a purple disk with center (219, 73) and radius 32.
; PLAN: r0=219(x), r1=73(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 73
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
