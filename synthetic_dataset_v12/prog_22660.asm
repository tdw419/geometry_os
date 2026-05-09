; DESCRIPTION: Renders a yellow line between points (105, 252) and (461, 51).
; PLAN: r0=105(x1), r1=252(y1), r2=461(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 252
LDI r2, 461
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
