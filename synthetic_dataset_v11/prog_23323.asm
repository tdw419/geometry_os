; DESCRIPTION: Renders a blue line between points (212, 123) and (49, 30).
; PLAN: r0=212(x1), r1=123(y1), r2=49(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 123
LDI r2, 49
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
