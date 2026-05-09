; DESCRIPTION: Renders a orange line between points (165, 142) and (211, 9).
; PLAN: r0=165(x1), r1=142(y1), r2=211(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 142
LDI r2, 211
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
