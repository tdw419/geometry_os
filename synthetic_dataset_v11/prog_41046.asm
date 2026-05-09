; DESCRIPTION: Renders a red line between points (180, 102) and (216, 66).
; PLAN: r0=180(x1), r1=102(y1), r2=216(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 102
LDI r2, 216
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
