; DESCRIPTION: Renders a red line between points (216, 6) and (127, 51).
; PLAN: r0=216(x1), r1=6(y1), r2=127(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 6
LDI r2, 127
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
