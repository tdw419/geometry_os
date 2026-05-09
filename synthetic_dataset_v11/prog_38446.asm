; DESCRIPTION: Places a green line segment connecting (181, 203) to (156, 238).
; PLAN: r0=181(x1), r1=203(y1), r2=156(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 203
LDI r2, 156
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
