; DESCRIPTION: Renders a purple line between points (178, 165) and (199, 9).
; PLAN: r0=178(x1), r1=165(y1), r2=199(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 165
LDI r2, 199
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
