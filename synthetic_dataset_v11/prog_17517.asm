; DESCRIPTION: Renders a purple line between points (177, 215) and (109, 177).
; PLAN: r0=177(x1), r1=215(y1), r2=109(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 215
LDI r2, 109
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
