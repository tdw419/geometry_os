; DESCRIPTION: Renders a orange line between points (471, 181) and (228, 247).
; PLAN: r0=471(x1), r1=181(y1), r2=228(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 181
LDI r2, 228
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
