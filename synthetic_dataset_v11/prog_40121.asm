; DESCRIPTION: Places a green circle of radius 51 at center (126, 145).
; PLAN: r0=126(x), r1=145(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 145
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
