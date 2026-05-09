; DESCRIPTION: Renders a blue line between points (161, 203) and (12, 49).
; PLAN: r0=161(x1), r1=203(y1), r2=12(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 203
LDI r2, 12
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
