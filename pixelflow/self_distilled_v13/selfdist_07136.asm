; DESCRIPTION: Renders a orange line segment connecting (81, 125) to (50, 167).
; PLAN: r0=81(x1), r1=125(y1), r2=50(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 125
LDI r2, 50
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
