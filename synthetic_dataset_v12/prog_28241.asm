; DESCRIPTION: Places a green line segment connecting (113, 227) to (78, 255).
; PLAN: r0=113(x1), r1=227(y1), r2=78(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 227
LDI r2, 78
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
