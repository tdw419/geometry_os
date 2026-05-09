; DESCRIPTION: Renders a purple line between points (107, 40) and (189, 76).
; PLAN: r0=107(x1), r1=40(y1), r2=189(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 40
LDI r2, 189
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
