; DESCRIPTION: Places a yellow line segment connecting (501, 170) to (283, 255).
; PLAN: r0=501(x1), r1=170(y1), r2=283(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 170
LDI r2, 283
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
