; DESCRIPTION: Renders a orange line between points (297, 121) and (208, 29).
; PLAN: r0=297(x1), r1=121(y1), r2=208(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 121
LDI r2, 208
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
