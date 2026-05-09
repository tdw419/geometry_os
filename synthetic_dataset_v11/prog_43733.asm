; DESCRIPTION: Renders a red line between points (132, 170) and (69, 163).
; PLAN: r0=132(x1), r1=170(y1), r2=69(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 170
LDI r2, 69
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
