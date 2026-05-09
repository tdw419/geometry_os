; DESCRIPTION: Renders a purple line between points (120, 126) and (124, 43).
; PLAN: r0=120(x1), r1=126(y1), r2=124(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 126
LDI r2, 124
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
