; DESCRIPTION: Places a blue line segment connecting (283, 223) to (203, 97).
; PLAN: r0=283(x1), r1=223(y1), r2=203(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 223
LDI r2, 203
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
