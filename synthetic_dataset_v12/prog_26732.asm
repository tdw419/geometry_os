; DESCRIPTION: Renders a purple line between points (301, 227) and (4, 161).
; PLAN: r0=301(x1), r1=227(y1), r2=4(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 227
LDI r2, 4
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
