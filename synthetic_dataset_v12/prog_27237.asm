; DESCRIPTION: Renders a purple line between points (197, 191) and (86, 90).
; PLAN: r0=197(x1), r1=191(y1), r2=86(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 191
LDI r2, 86
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
