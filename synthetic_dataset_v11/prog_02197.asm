; DESCRIPTION: Renders a purple line between points (246, 243) and (40, 32).
; PLAN: r0=246(x1), r1=243(y1), r2=40(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 243
LDI r2, 40
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
