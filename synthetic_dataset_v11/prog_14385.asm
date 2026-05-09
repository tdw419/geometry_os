; DESCRIPTION: Renders a orange line between points (14, 14) and (123, 59).
; PLAN: r0=14(x1), r1=14(y1), r2=123(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 14
LDI r2, 123
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
