; DESCRIPTION: Places a green line segment connecting (57, 246) to (203, 17).
; PLAN: r0=57(x1), r1=246(y1), r2=203(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 246
LDI r2, 203
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
