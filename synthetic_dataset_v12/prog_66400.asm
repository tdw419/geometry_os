; DESCRIPTION: Draws a purple line from (90, 140) to (372, 11).
; PLAN: r0=90(x1), r1=140(y1), r2=372(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 140
LDI r2, 372
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
