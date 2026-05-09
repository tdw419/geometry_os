; DESCRIPTION: Renders a orange line between points (9, 204) and (60, 194).
; PLAN: r0=9(x1), r1=204(y1), r2=60(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 204
LDI r2, 60
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
