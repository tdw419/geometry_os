; DESCRIPTION: Places a green line segment connecting (11, 133) to (203, 144).
; PLAN: r0=11(x1), r1=133(y1), r2=203(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 133
LDI r2, 203
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
