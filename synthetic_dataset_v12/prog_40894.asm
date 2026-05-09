; DESCRIPTION: Places a yellow line segment connecting (118, 209) to (37, 165).
; PLAN: r0=118(x1), r1=209(y1), r2=37(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 209
LDI r2, 37
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
