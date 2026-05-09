; DESCRIPTION: Places a white line segment connecting (163, 80) to (156, 108).
; PLAN: r0=163(x1), r1=80(y1), r2=156(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 80
LDI r2, 156
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
