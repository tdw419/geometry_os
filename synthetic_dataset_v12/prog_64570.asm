; DESCRIPTION: Draws a black line from (409, 187) to (472, 136).
; PLAN: r0=409(x1), r1=187(y1), r2=472(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 187
LDI r2, 472
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
