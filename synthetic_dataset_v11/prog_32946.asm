; DESCRIPTION: Renders a red line between points (198, 158) and (150, 140).
; PLAN: r0=198(x1), r1=158(y1), r2=150(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 158
LDI r2, 150
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
