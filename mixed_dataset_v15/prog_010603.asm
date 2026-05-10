; DESCRIPTION: Renders a purple line between points (303, 247) and (233, 65).
; PLAN: r0=303(x1), r1=247(y1), r2=233(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 247
LDI r2, 233
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
