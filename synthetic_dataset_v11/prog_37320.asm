; DESCRIPTION: Places a yellow line segment connecting (30, 78) to (203, 117).
; PLAN: r0=30(x1), r1=78(y1), r2=203(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 78
LDI r2, 203
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
