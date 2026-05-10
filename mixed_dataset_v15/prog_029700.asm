; DESCRIPTION: Places a green line segment connecting (7, 246) to (333, 66).
; PLAN: r0=7(x1), r1=246(y1), r2=333(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 246
LDI r2, 333
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
