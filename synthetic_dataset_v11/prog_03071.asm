; DESCRIPTION: Places a purple circle of radius 51 at center (99, 174).
; PLAN: r0=99(x), r1=174(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 174
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
