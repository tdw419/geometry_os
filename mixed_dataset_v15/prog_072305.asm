; DESCRIPTION: Places a yellow line segment connecting (326, 187) to (118, 165).
; PLAN: r0=326(x1), r1=187(y1), r2=118(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 187
LDI r2, 118
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
