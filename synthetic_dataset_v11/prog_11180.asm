; DESCRIPTION: Places a green line segment connecting (194, 181) to (28, 122).
; PLAN: r0=194(x1), r1=181(y1), r2=28(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 181
LDI r2, 28
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
