; DESCRIPTION: Renders a orange line between points (470, 165) and (498, 167).
; PLAN: r0=470(x1), r1=165(y1), r2=498(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 165
LDI r2, 498
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
