; DESCRIPTION: Renders a purple line between points (408, 36) and (355, 232).
; PLAN: r0=408(x1), r1=36(y1), r2=355(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 36
LDI r2, 355
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
