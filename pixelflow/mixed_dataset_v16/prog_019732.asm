; DESCRIPTION: Renders a black line between points (282, 54) and (26, 9).
; PLAN: r0=282(x1), r1=54(y1), r2=26(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 54
LDI r2, 26
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
