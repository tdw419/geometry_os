; DESCRIPTION: Draws a purple line from (511, 162) to (200, 55).
; PLAN: r0=511(x1), r1=162(y1), r2=200(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 162
LDI r2, 200
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
