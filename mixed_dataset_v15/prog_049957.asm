; DESCRIPTION: Draws a black line from (432, 17) to (283, 184).
; PLAN: r0=432(x1), r1=17(y1), r2=283(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 17
LDI r2, 283
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
