; DESCRIPTION: Renders a orange line between points (132, 116) and (118, 21).
; PLAN: r0=132(x1), r1=116(y1), r2=118(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 116
LDI r2, 118
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
