; DESCRIPTION: Renders a orange line between points (228, 112) and (233, 165).
; PLAN: r0=228(x1), r1=112(y1), r2=233(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 112
LDI r2, 233
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
