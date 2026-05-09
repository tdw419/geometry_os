; DESCRIPTION: Renders a orange line between points (248, 112) and (240, 136).
; PLAN: r0=248(x1), r1=112(y1), r2=240(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 112
LDI r2, 240
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
