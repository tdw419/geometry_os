; DESCRIPTION: Renders a orange line between points (14, 113) and (44, 203).
; PLAN: r0=14(x1), r1=113(y1), r2=44(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 113
LDI r2, 44
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
