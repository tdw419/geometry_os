; DESCRIPTION: Draws a blue line from (185, 20) to (452, 90).
; PLAN: r0=185(x1), r1=20(y1), r2=452(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 20
LDI r2, 452
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
