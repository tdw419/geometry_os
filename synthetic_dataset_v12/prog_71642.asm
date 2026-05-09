; DESCRIPTION: Renders a purple line between points (444, 191) and (311, 246).
; PLAN: r0=444(x1), r1=191(y1), r2=311(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 191
LDI r2, 311
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
