; DESCRIPTION: Places a yellow line segment connecting (154, 122) to (118, 140).
; PLAN: r0=154(x1), r1=122(y1), r2=118(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 122
LDI r2, 118
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
