; DESCRIPTION: Renders a orange line between points (6, 85) and (85, 198).
; PLAN: r0=6(x1), r1=85(y1), r2=85(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 85
LDI r2, 85
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
