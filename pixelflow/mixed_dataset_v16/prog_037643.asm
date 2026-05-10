; DESCRIPTION: Places a yellow line segment connecting (246, 97) to (338, 24).
; PLAN: r0=246(x1), r1=97(y1), r2=338(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 97
LDI r2, 338
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
