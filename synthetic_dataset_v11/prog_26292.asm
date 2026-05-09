; DESCRIPTION: Renders a orange line between points (144, 134) and (66, 38).
; PLAN: r0=144(x1), r1=134(y1), r2=66(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 134
LDI r2, 66
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
