; DESCRIPTION: Renders a orange line between points (505, 156) and (327, 99).
; PLAN: r0=505(x1), r1=156(y1), r2=327(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 156
LDI r2, 327
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
