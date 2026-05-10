; DESCRIPTION: Renders a orange line between points (507, 66) and (507, 206).
; PLAN: r0=507(x1), r1=66(y1), r2=507(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 66
LDI r2, 507
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
