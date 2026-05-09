; DESCRIPTION: Places a green circle of radius 51 at center (427, 56).
; PLAN: r0=427(x), r1=56(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 56
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
