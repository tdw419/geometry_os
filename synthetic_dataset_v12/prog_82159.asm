; DESCRIPTION: Renders a orange line between points (304, 84) and (342, 19).
; PLAN: r0=304(x1), r1=84(y1), r2=342(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 84
LDI r2, 342
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
