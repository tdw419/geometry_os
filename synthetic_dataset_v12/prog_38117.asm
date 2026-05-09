; DESCRIPTION: Draws a blue line from (266, 62) to (88, 107).
; PLAN: r0=266(x1), r1=62(y1), r2=88(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 62
LDI r2, 88
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
