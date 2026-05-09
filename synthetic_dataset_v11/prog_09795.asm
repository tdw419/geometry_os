; DESCRIPTION: Renders a red line between points (148, 170) and (26, 10).
; PLAN: r0=148(x1), r1=170(y1), r2=26(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 170
LDI r2, 26
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
