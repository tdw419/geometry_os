; DESCRIPTION: Places a blue line segment connecting (37, 49) to (172, 173).
; PLAN: r0=37(x1), r1=49(y1), r2=172(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 49
LDI r2, 172
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
