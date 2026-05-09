; DESCRIPTION: Renders a purple line between points (105, 126) and (140, 92).
; PLAN: r0=105(x1), r1=126(y1), r2=140(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 126
LDI r2, 140
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
