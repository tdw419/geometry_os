; DESCRIPTION: Draws a purple line from (181, 11) to (81, 33).
; PLAN: r0=181(x1), r1=11(y1), r2=81(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 11
LDI r2, 81
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
