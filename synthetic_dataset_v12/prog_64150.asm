; DESCRIPTION: Places a green line segment connecting (37, 155) to (261, 246).
; PLAN: r0=37(x1), r1=155(y1), r2=261(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 155
LDI r2, 261
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
