; DESCRIPTION: Renders a orange line between points (62, 113) and (260, 25).
; PLAN: r0=62(x1), r1=113(y1), r2=260(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 113
LDI r2, 260
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
