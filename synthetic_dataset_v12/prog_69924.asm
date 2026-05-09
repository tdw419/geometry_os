; DESCRIPTION: Renders a orange line between points (44, 188) and (120, 204).
; PLAN: r0=44(x1), r1=188(y1), r2=120(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 188
LDI r2, 120
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
