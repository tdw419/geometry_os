; DESCRIPTION: Places a green line segment connecting (163, 61) to (205, 83).
; PLAN: r0=163(x1), r1=61(y1), r2=205(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 61
LDI r2, 205
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
