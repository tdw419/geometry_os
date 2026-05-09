; DESCRIPTION: Renders a orange line between points (107, 188) and (55, 21).
; PLAN: r0=107(x1), r1=188(y1), r2=55(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 188
LDI r2, 55
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
