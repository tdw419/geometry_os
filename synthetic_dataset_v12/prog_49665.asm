; DESCRIPTION: Renders a orange line between points (116, 244) and (98, 157).
; PLAN: r0=116(x1), r1=244(y1), r2=98(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 244
LDI r2, 98
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
