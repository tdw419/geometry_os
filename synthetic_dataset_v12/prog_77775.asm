; DESCRIPTION: Renders a purple line between points (449, 247) and (296, 99).
; PLAN: r0=449(x1), r1=247(y1), r2=296(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 247
LDI r2, 296
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
