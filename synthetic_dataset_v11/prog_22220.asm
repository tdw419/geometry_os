; DESCRIPTION: Renders a purple line between points (71, 187) and (5, 26).
; PLAN: r0=71(x1), r1=187(y1), r2=5(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 187
LDI r2, 5
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
