; DESCRIPTION: Places a white line segment connecting (78, 222) to (136, 204).
; PLAN: r0=78(x1), r1=222(y1), r2=136(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 222
LDI r2, 136
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
