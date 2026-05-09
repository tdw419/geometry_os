; DESCRIPTION: Places a green line segment connecting (261, 40) to (236, 217).
; PLAN: r0=261(x1), r1=40(y1), r2=236(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 40
LDI r2, 236
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
