; DESCRIPTION: Places a blue line segment connecting (132, 102) to (203, 32).
; PLAN: r0=132(x1), r1=102(y1), r2=203(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 102
LDI r2, 203
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
