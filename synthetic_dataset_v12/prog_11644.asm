; DESCRIPTION: Renders a orange line between points (411, 81) and (359, 187).
; PLAN: r0=411(x1), r1=81(y1), r2=359(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 81
LDI r2, 359
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
