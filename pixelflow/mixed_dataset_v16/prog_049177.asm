; DESCRIPTION: Draws a blue line from (452, 18) to (397, 96).
; PLAN: r0=452(x1), r1=18(y1), r2=397(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 18
LDI r2, 397
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
