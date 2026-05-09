; DESCRIPTION: Places a green line segment connecting (199, 145) to (203, 56).
; PLAN: r0=199(x1), r1=145(y1), r2=203(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 145
LDI r2, 203
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
