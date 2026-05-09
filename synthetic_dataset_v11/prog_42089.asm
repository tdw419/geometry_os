; DESCRIPTION: Renders a yellow line between points (172, 183) and (20, 159).
; PLAN: r0=172(x1), r1=183(y1), r2=20(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 183
LDI r2, 20
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
