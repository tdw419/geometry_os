; DESCRIPTION: Renders a blue line between points (216, 203) and (12, 0).
; PLAN: r0=216(x1), r1=203(y1), r2=12(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 203
LDI r2, 12
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
