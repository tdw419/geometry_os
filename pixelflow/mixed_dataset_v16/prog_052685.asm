; DESCRIPTION: Renders a purple line between points (368, 84) and (375, 153).
; PLAN: r0=368(x1), r1=84(y1), r2=375(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 84
LDI r2, 375
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
