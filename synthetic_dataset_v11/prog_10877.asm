; DESCRIPTION: Renders a red line between points (15, 140) and (9, 9).
; PLAN: r0=15(x1), r1=140(y1), r2=9(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 140
LDI r2, 9
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
