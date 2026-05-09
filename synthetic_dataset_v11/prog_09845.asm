; DESCRIPTION: Places a green line segment connecting (203, 222) to (78, 181).
; PLAN: r0=203(x1), r1=222(y1), r2=78(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 222
LDI r2, 78
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
