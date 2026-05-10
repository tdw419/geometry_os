; DESCRIPTION: Places a blue line segment connecting (144, 252) to (203, 12).
; PLAN: r0=144(x1), r1=252(y1), r2=203(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 252
LDI r2, 203
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
