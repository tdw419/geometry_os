; DESCRIPTION: Places a blue circle of radius 51 at center (456, 181).
; PLAN: r0=456(x), r1=181(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 181
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
