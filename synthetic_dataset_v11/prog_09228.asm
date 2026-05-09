; DESCRIPTION: Places a magenta line segment connecting (110, 119) to (59, 203).
; PLAN: r0=110(x1), r1=119(y1), r2=59(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 119
LDI r2, 59
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
