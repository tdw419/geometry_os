; DESCRIPTION: Renders a orange line between points (28, 150) and (85, 135).
; PLAN: r0=28(x1), r1=150(y1), r2=85(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 150
LDI r2, 85
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
