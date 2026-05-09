; DESCRIPTION: Renders a orange line between points (227, 15) and (228, 142).
; PLAN: r0=227(x1), r1=15(y1), r2=228(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 15
LDI r2, 228
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
