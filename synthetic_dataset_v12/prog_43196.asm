; DESCRIPTION: Renders a purple line between points (190, 191) and (82, 207).
; PLAN: r0=190(x1), r1=191(y1), r2=82(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 191
LDI r2, 82
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
