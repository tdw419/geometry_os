; DESCRIPTION: Draws a blue line from (122, 149) to (49, 185).
; PLAN: r0=122(x1), r1=149(y1), r2=49(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 149
LDI r2, 49
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
