; DESCRIPTION: Renders a orange line between points (112, 183) and (330, 230).
; PLAN: r0=112(x1), r1=183(y1), r2=330(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 183
LDI r2, 330
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
