; DESCRIPTION: Renders a magenta line between points (149, 107) and (179, 78).
; PLAN: r0=149(x1), r1=107(y1), r2=179(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 107
LDI r2, 179
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
