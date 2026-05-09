; DESCRIPTION: Places a blue circle of radius 51 at center (461, 108).
; PLAN: r0=461(x), r1=108(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 108
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
