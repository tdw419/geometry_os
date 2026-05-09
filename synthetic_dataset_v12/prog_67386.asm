; DESCRIPTION: Places a green line segment connecting (151, 188) to (382, 170).
; PLAN: r0=151(x1), r1=188(y1), r2=382(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 188
LDI r2, 382
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
