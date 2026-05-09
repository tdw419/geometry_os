; DESCRIPTION: Renders a orange line between points (96, 43) and (29, 157).
; PLAN: r0=96(x1), r1=43(y1), r2=29(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 43
LDI r2, 29
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
