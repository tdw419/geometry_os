; DESCRIPTION: Renders a orange line between points (95, 113) and (162, 141).
; PLAN: r0=95(x1), r1=113(y1), r2=162(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 113
LDI r2, 162
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
