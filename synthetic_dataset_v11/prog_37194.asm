; DESCRIPTION: Places a yellow line segment connecting (29, 233) to (109, 250).
; PLAN: r0=29(x1), r1=233(y1), r2=109(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 233
LDI r2, 109
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
