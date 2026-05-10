; DESCRIPTION: Places a green line segment connecting (100, 8) to (426, 156).
; PLAN: r0=100(x1), r1=8(y1), r2=426(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 8
LDI r2, 426
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
