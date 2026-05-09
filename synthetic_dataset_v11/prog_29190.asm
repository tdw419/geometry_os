; DESCRIPTION: Renders a orange line between points (167, 40) and (125, 155).
; PLAN: r0=167(x1), r1=40(y1), r2=125(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 40
LDI r2, 125
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
