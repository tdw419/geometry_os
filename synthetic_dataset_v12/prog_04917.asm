; DESCRIPTION: Renders a orange line between points (143, 113) and (202, 58).
; PLAN: r0=143(x1), r1=113(y1), r2=202(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 113
LDI r2, 202
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
