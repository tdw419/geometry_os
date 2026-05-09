; DESCRIPTION: Places a blue line segment connecting (105, 10) to (203, 62).
; PLAN: r0=105(x1), r1=10(y1), r2=203(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 10
LDI r2, 203
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
