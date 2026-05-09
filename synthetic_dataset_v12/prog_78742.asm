; DESCRIPTION: Renders a purple line between points (150, 122) and (323, 233).
; PLAN: r0=150(x1), r1=122(y1), r2=323(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 122
LDI r2, 323
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
