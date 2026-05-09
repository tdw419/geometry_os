; DESCRIPTION: Renders a yellow line between points (238, 89) and (283, 51).
; PLAN: r0=238(x1), r1=89(y1), r2=283(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 89
LDI r2, 283
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
