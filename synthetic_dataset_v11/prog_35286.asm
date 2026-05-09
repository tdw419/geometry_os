; DESCRIPTION: Places a green line segment connecting (188, 57) to (157, 246).
; PLAN: r0=188(x1), r1=57(y1), r2=157(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 57
LDI r2, 157
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
