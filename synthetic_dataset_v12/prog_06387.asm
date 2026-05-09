; DESCRIPTION: Renders a orange line between points (64, 86) and (149, 68).
; PLAN: r0=64(x1), r1=86(y1), r2=149(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 86
LDI r2, 149
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
