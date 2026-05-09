; DESCRIPTION: Places a white line segment connecting (65, 156) to (141, 4).
; PLAN: r0=65(x1), r1=156(y1), r2=141(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 156
LDI r2, 141
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
