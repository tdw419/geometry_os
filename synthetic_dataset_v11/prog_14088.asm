; DESCRIPTION: Renders a black line between points (110, 156) and (36, 250).
; PLAN: r0=110(x1), r1=156(y1), r2=36(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 156
LDI r2, 36
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
