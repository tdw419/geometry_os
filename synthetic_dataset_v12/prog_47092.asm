; DESCRIPTION: Renders a purple line between points (431, 228) and (26, 112).
; PLAN: r0=431(x1), r1=228(y1), r2=26(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 228
LDI r2, 26
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
