; DESCRIPTION: Places a yellow line segment connecting (203, 170) to (50, 192).
; PLAN: r0=203(x1), r1=170(y1), r2=50(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 170
LDI r2, 50
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
