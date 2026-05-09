; DESCRIPTION: Renders a purple line between points (400, 114) and (290, 122).
; PLAN: r0=400(x1), r1=114(y1), r2=290(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 114
LDI r2, 290
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
