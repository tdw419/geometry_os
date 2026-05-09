; DESCRIPTION: Places a green line segment connecting (230, 109) to (28, 66).
; PLAN: r0=230(x1), r1=109(y1), r2=28(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 109
LDI r2, 28
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
