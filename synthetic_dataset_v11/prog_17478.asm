; DESCRIPTION: Renders a orange line between points (144, 174) and (12, 61).
; PLAN: r0=144(x1), r1=174(y1), r2=12(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 174
LDI r2, 12
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
