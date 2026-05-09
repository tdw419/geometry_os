; DESCRIPTION: Places a orange line segment connecting (28, 255) to (264, 156).
; PLAN: r0=28(x1), r1=255(y1), r2=264(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 255
LDI r2, 264
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
