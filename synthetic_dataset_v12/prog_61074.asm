; DESCRIPTION: Renders a purple line between points (342, 170) and (176, 50).
; PLAN: r0=342(x1), r1=170(y1), r2=176(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 170
LDI r2, 176
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
