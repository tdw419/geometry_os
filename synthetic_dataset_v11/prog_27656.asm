; DESCRIPTION: Renders a orange line between points (112, 185) and (102, 29).
; PLAN: r0=112(x1), r1=185(y1), r2=102(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 185
LDI r2, 102
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
