; DESCRIPTION: Renders a orange line between points (132, 88) and (136, 6).
; PLAN: r0=132(x1), r1=88(y1), r2=136(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 88
LDI r2, 136
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
