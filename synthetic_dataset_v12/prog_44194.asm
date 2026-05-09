; DESCRIPTION: Places a magenta line segment connecting (416, 203) to (22, 17).
; PLAN: r0=416(x1), r1=203(y1), r2=22(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 203
LDI r2, 22
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
