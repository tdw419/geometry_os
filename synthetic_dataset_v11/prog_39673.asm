; DESCRIPTION: Places a green line segment connecting (175, 28) to (183, 122).
; PLAN: r0=175(x1), r1=28(y1), r2=183(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 28
LDI r2, 183
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
