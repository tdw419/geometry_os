; DESCRIPTION: Renders a purple line between points (37, 167) and (52, 161).
; PLAN: r0=37(x1), r1=167(y1), r2=52(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 167
LDI r2, 52
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
