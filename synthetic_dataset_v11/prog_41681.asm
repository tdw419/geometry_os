; DESCRIPTION: Places a green line segment connecting (1, 188) to (129, 135).
; PLAN: r0=1(x1), r1=188(y1), r2=129(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 188
LDI r2, 129
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
