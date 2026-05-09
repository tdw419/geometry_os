; DESCRIPTION: Draws a purple line from (434, 54) to (478, 140).
; PLAN: r0=434(x1), r1=54(y1), r2=478(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 54
LDI r2, 478
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
