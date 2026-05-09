; DESCRIPTION: Renders a purple line between points (388, 97) and (301, 163).
; PLAN: r0=388(x1), r1=97(y1), r2=301(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 97
LDI r2, 301
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
