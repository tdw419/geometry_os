; DESCRIPTION: Renders a black line between points (475, 122) and (172, 89).
; PLAN: r0=475(x1), r1=122(y1), r2=172(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 122
LDI r2, 172
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
