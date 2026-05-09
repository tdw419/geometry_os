; DESCRIPTION: Draws a blue line from (25, 193) to (452, 157).
; PLAN: r0=25(x1), r1=193(y1), r2=452(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 193
LDI r2, 452
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
