; DESCRIPTION: Draws a blue line from (10, 119) to (289, 141).
; PLAN: r0=10(x1), r1=119(y1), r2=289(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 119
LDI r2, 289
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
