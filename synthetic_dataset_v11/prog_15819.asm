; DESCRIPTION: Renders a yellow line between points (132, 144) and (9, 78).
; PLAN: r0=132(x1), r1=144(y1), r2=9(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 144
LDI r2, 9
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
