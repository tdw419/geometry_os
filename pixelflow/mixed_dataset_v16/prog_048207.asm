; DESCRIPTION: Renders a black line between points (427, 143) and (357, 59).
; PLAN: r0=427(x1), r1=143(y1), r2=357(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 143
LDI r2, 357
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
