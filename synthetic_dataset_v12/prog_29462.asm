; DESCRIPTION: Renders a purple disk with center (447, 132) and radius 32.
; PLAN: r0=447(x), r1=132(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 132
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
