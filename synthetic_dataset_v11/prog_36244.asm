; DESCRIPTION: Draws a blue line from (66, 184) to (133, 170).
; PLAN: r0=66(x1), r1=184(y1), r2=133(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 184
LDI r2, 133
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
