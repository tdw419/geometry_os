; DESCRIPTION: Draws a purple line from (159, 185) to (99, 120).
; PLAN: r0=159(x1), r1=185(y1), r2=99(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 185
LDI r2, 99
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
