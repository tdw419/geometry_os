; DESCRIPTION: Renders a orange line between points (206, 73) and (47, 74).
; PLAN: r0=206(x1), r1=73(y1), r2=47(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 73
LDI r2, 47
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
