; DESCRIPTION: Places a green line segment connecting (276, 149) to (203, 0).
; PLAN: r0=276(x1), r1=149(y1), r2=203(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 149
LDI r2, 203
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
