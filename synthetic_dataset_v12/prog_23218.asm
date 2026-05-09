; DESCRIPTION: Places a blue line segment connecting (122, 142) to (466, 252).
; PLAN: r0=122(x1), r1=142(y1), r2=466(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 142
LDI r2, 466
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
