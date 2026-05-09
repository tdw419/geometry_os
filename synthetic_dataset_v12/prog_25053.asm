; DESCRIPTION: Renders a orange line between points (183, 142) and (20, 183).
; PLAN: r0=183(x1), r1=142(y1), r2=20(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 142
LDI r2, 20
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
