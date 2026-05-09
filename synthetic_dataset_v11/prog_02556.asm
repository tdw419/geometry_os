; DESCRIPTION: Renders a magenta line between points (11, 217) and (51, 216).
; PLAN: r0=11(x1), r1=217(y1), r2=51(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 217
LDI r2, 51
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
