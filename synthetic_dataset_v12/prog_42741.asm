; DESCRIPTION: Places a green line segment connecting (474, 101) to (207, 66).
; PLAN: r0=474(x1), r1=101(y1), r2=207(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 101
LDI r2, 207
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
