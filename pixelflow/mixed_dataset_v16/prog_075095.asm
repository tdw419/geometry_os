; DESCRIPTION: Draws a blue line from (508, 172) to (484, 247).
; PLAN: r0=508(x1), r1=172(y1), r2=484(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 172
LDI r2, 484
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
