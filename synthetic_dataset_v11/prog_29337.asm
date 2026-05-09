; DESCRIPTION: Places a purple line segment connecting (51, 46) to (245, 238).
; PLAN: r0=51(x1), r1=46(y1), r2=245(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 46
LDI r2, 245
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
