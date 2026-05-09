; DESCRIPTION: Places a yellow circle of radius 51 at center (350, 180).
; PLAN: r0=350(x), r1=180(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 180
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
