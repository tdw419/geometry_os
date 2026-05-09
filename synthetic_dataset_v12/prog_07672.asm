; DESCRIPTION: Renders a red line between points (26, 170) and (171, 11).
; PLAN: r0=26(x1), r1=170(y1), r2=171(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 170
LDI r2, 171
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
