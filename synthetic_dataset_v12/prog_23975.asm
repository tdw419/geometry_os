; DESCRIPTION: Places a green line segment connecting (382, 166) to (430, 100).
; PLAN: r0=382(x1), r1=166(y1), r2=430(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 166
LDI r2, 430
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
