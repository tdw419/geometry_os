; DESCRIPTION: Renders a purple line between points (186, 215) and (120, 106).
; PLAN: r0=186(x1), r1=215(y1), r2=120(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 215
LDI r2, 120
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
