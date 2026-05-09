; DESCRIPTION: Renders a purple line between points (400, 86) and (153, 178).
; PLAN: r0=400(x1), r1=86(y1), r2=153(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 86
LDI r2, 153
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
