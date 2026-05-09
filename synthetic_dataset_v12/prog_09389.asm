; DESCRIPTION: Renders a purple line between points (109, 72) and (94, 86).
; PLAN: r0=109(x1), r1=72(y1), r2=94(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 72
LDI r2, 94
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
