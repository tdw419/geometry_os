; DESCRIPTION: Places a green line segment connecting (117, 118) to (49, 37).
; PLAN: r0=117(x1), r1=118(y1), r2=49(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 118
LDI r2, 49
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
