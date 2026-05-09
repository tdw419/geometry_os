; DESCRIPTION: Renders a orange line between points (334, 227) and (262, 243).
; PLAN: r0=334(x1), r1=227(y1), r2=262(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 227
LDI r2, 262
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
