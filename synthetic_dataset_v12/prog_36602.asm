; DESCRIPTION: Places a green line segment connecting (246, 163) to (261, 153).
; PLAN: r0=246(x1), r1=163(y1), r2=261(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 163
LDI r2, 261
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
