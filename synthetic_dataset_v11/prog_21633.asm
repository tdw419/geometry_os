; DESCRIPTION: Draws a blue line from (68, 227) to (223, 212).
; PLAN: r0=68(x1), r1=227(y1), r2=223(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 227
LDI r2, 223
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
