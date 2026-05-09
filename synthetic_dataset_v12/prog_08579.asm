; DESCRIPTION: Renders a purple line between points (167, 70) and (37, 26).
; PLAN: r0=167(x1), r1=70(y1), r2=37(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 70
LDI r2, 37
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
