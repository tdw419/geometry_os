; DESCRIPTION: Renders a purple line between points (92, 24) and (472, 177).
; PLAN: r0=92(x1), r1=24(y1), r2=472(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 24
LDI r2, 472
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
