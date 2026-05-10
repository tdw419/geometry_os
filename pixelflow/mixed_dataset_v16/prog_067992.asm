; DESCRIPTION: Places a green line segment connecting (34, 233) to (170, 246).
; PLAN: r0=34(x1), r1=233(y1), r2=170(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 233
LDI r2, 170
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
