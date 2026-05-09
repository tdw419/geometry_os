; DESCRIPTION: Places a green line segment connecting (28, 123) to (420, 37).
; PLAN: r0=28(x1), r1=123(y1), r2=420(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 123
LDI r2, 420
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
