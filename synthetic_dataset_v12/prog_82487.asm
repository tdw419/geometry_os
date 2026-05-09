; DESCRIPTION: Renders a purple line between points (326, 36) and (265, 8).
; PLAN: r0=326(x1), r1=36(y1), r2=265(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 36
LDI r2, 265
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
