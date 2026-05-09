; DESCRIPTION: Places a green line segment connecting (259, 60) to (400, 114).
; PLAN: r0=259(x1), r1=60(y1), r2=400(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 60
LDI r2, 400
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
