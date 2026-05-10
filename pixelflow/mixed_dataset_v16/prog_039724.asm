; DESCRIPTION: Places a green line segment connecting (97, 135) to (246, 47).
; PLAN: r0=97(x1), r1=135(y1), r2=246(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 135
LDI r2, 246
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
