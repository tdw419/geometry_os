; DESCRIPTION: Renders a purple line between points (54, 126) and (182, 140).
; PLAN: r0=54(x1), r1=126(y1), r2=182(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 126
LDI r2, 182
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
