; DESCRIPTION: Renders a orange line between points (464, 142) and (430, 36).
; PLAN: r0=464(x1), r1=142(y1), r2=430(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 142
LDI r2, 430
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
