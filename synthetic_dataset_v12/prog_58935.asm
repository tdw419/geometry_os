; DESCRIPTION: Renders a orange line between points (423, 135) and (181, 157).
; PLAN: r0=423(x1), r1=135(y1), r2=181(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 135
LDI r2, 181
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
