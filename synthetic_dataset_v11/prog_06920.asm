; DESCRIPTION: Renders a orange line between points (142, 204) and (70, 68).
; PLAN: r0=142(x1), r1=204(y1), r2=70(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 204
LDI r2, 70
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
