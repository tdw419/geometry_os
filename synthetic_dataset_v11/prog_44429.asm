; DESCRIPTION: Renders a orange line between points (106, 112) and (20, 221).
; PLAN: r0=106(x1), r1=112(y1), r2=20(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 112
LDI r2, 20
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
