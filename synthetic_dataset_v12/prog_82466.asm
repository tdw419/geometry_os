; DESCRIPTION: Places a green circle of radius 19 at center (51, 219).
; PLAN: r0=51(x), r1=219(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 219
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
