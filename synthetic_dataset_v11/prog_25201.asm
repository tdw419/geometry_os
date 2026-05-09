; DESCRIPTION: Draws a blue line from (83, 246) to (119, 98).
; PLAN: r0=83(x1), r1=246(y1), r2=119(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 246
LDI r2, 119
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
