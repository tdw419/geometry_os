; DESCRIPTION: Draws a black line from (77, 222) to (227, 4).
; PLAN: r0=77(x1), r1=222(y1), r2=227(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 222
LDI r2, 227
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
