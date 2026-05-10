; DESCRIPTION: Renders a purple line between points (226, 187) and (102, 89).
; PLAN: r0=226(x1), r1=187(y1), r2=102(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 187
LDI r2, 102
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
