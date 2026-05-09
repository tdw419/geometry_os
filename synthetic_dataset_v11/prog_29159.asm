; DESCRIPTION: Renders a orange line between points (247, 85) and (231, 135).
; PLAN: r0=247(x1), r1=85(y1), r2=231(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 85
LDI r2, 231
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
