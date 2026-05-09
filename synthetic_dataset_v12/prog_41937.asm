; DESCRIPTION: Places a green line segment connecting (222, 9) to (28, 155).
; PLAN: r0=222(x1), r1=9(y1), r2=28(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 9
LDI r2, 28
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
