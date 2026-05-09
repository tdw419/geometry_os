; DESCRIPTION: Renders a purple line between points (19, 64) and (126, 99).
; PLAN: r0=19(x1), r1=64(y1), r2=126(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 64
LDI r2, 126
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
