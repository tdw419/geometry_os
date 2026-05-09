; DESCRIPTION: Places a magenta line segment connecting (175, 140) to (41, 17).
; PLAN: r0=175(x1), r1=140(y1), r2=41(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 140
LDI r2, 41
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
