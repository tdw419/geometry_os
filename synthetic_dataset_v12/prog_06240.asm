; DESCRIPTION: Places a magenta line segment connecting (229, 119) to (265, 203).
; PLAN: r0=229(x1), r1=119(y1), r2=265(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 119
LDI r2, 265
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
