; DESCRIPTION: Renders a black line between points (77, 248) and (222, 141).
; PLAN: r0=77(x1), r1=248(y1), r2=222(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 248
LDI r2, 222
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
