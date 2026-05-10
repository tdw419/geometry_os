; DESCRIPTION: Places a black line segment connecting (506, 248) to (324, 41).
; PLAN: r0=506(x1), r1=248(y1), r2=324(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 248
LDI r2, 324
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
