; DESCRIPTION: Renders a purple line between points (233, 216) and (228, 202).
; PLAN: r0=233(x1), r1=216(y1), r2=228(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 216
LDI r2, 228
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
