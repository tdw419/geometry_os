; DESCRIPTION: Renders a orange line between points (65, 81) and (167, 203).
; PLAN: r0=65(x1), r1=81(y1), r2=167(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 81
LDI r2, 167
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
