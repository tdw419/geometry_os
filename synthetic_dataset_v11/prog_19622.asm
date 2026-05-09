; DESCRIPTION: Places a green line segment connecting (190, 156) to (134, 182).
; PLAN: r0=190(x1), r1=156(y1), r2=134(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 156
LDI r2, 134
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
