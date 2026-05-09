; DESCRIPTION: Renders a orange line between points (123, 200) and (304, 20).
; PLAN: r0=123(x1), r1=200(y1), r2=304(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 200
LDI r2, 304
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
