; DESCRIPTION: Renders a purple line between points (61, 159) and (229, 247).
; PLAN: r0=61(x1), r1=159(y1), r2=229(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 159
LDI r2, 229
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
