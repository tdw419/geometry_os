; DESCRIPTION: Renders a black line between points (0, 13) and (181, 77).
; PLAN: r0=0(x1), r1=13(y1), r2=181(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 13
LDI r2, 181
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
