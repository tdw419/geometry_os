; DESCRIPTION: Places a green line segment connecting (432, 56) to (246, 11).
; PLAN: r0=432(x1), r1=56(y1), r2=246(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 56
LDI r2, 246
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
