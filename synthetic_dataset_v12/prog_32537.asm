; DESCRIPTION: Renders a orange line between points (149, 157) and (268, 226).
; PLAN: r0=149(x1), r1=157(y1), r2=268(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 157
LDI r2, 268
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
