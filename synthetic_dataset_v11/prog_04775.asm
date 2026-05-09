; DESCRIPTION: Renders a blue line between points (49, 30) and (153, 252).
; PLAN: r0=49(x1), r1=30(y1), r2=153(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 30
LDI r2, 153
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
