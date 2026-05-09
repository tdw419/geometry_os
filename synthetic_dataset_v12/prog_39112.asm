; DESCRIPTION: Draws a blue line from (452, 184) to (435, 80).
; PLAN: r0=452(x1), r1=184(y1), r2=435(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 184
LDI r2, 435
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
