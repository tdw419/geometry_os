; DESCRIPTION: Places a yellow line segment connecting (156, 121) to (413, 122).
; PLAN: r0=156(x1), r1=121(y1), r2=413(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 121
LDI r2, 413
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
