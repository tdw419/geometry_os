; DESCRIPTION: Renders a orange line between points (40, 165) and (8, 211).
; PLAN: r0=40(x1), r1=165(y1), r2=8(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 165
LDI r2, 8
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
