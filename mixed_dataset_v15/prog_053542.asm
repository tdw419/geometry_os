; DESCRIPTION: Renders a magenta line between points (102, 133) and (89, 251).
; PLAN: r0=102(x1), r1=133(y1), r2=89(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 133
LDI r2, 89
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
