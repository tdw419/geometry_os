; DESCRIPTION: Renders a orange line between points (121, 49) and (140, 172).
; PLAN: r0=121(x1), r1=49(y1), r2=140(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 49
LDI r2, 140
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
