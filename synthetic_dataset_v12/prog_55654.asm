; DESCRIPTION: Renders a black line between points (89, 62) and (146, 110).
; PLAN: r0=89(x1), r1=62(y1), r2=146(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 62
LDI r2, 146
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
