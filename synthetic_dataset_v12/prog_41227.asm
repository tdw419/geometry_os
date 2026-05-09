; DESCRIPTION: Renders a yellow line between points (79, 158) and (510, 1).
; PLAN: r0=79(x1), r1=158(y1), r2=510(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 158
LDI r2, 510
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
