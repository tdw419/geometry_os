; DESCRIPTION: Places a yellow line segment connecting (28, 91) to (90, 140).
; PLAN: r0=28(x1), r1=91(y1), r2=90(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 91
LDI r2, 90
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
