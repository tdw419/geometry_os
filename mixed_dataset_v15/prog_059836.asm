; DESCRIPTION: Draws a purple line from (247, 24) to (55, 40).
; PLAN: r0=247(x1), r1=24(y1), r2=55(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 24
LDI r2, 55
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
