; DESCRIPTION: Draws a black line from (6, 181) to (233, 227).
; PLAN: r0=6(x1), r1=181(y1), r2=233(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 181
LDI r2, 233
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
