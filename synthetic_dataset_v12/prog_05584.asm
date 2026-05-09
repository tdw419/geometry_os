; DESCRIPTION: Renders a orange line between points (194, 16) and (125, 80).
; PLAN: r0=194(x1), r1=16(y1), r2=125(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 16
LDI r2, 125
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
