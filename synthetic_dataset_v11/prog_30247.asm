; DESCRIPTION: Renders a purple line between points (75, 13) and (51, 118).
; PLAN: r0=75(x1), r1=13(y1), r2=51(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 13
LDI r2, 51
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
