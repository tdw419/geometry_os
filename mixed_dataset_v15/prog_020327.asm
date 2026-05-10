; DESCRIPTION: Renders a orange line between points (501, 68) and (304, 152).
; PLAN: r0=501(x1), r1=68(y1), r2=304(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 68
LDI r2, 304
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
