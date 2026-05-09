; DESCRIPTION: Places a blue line segment connecting (76, 132) to (28, 252).
; PLAN: r0=76(x1), r1=132(y1), r2=28(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 132
LDI r2, 28
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
