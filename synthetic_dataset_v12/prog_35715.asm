; DESCRIPTION: Places a green line segment connecting (6, 138) to (289, 51).
; PLAN: r0=6(x1), r1=138(y1), r2=289(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 138
LDI r2, 289
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
