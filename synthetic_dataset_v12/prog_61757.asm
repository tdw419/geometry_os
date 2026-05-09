; DESCRIPTION: Renders a orange line between points (471, 141) and (140, 193).
; PLAN: r0=471(x1), r1=141(y1), r2=140(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 141
LDI r2, 140
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
