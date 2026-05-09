; DESCRIPTION: Draws a blue line from (149, 203) to (31, 137).
; PLAN: r0=149(x1), r1=203(y1), r2=31(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 203
LDI r2, 31
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
