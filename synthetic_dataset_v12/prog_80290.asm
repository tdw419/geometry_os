; DESCRIPTION: Draws a purple line from (369, 252) to (443, 202).
; PLAN: r0=369(x1), r1=252(y1), r2=443(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 252
LDI r2, 443
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
