; DESCRIPTION: Places a yellow line segment connecting (207, 78) to (162, 135).
; PLAN: r0=207(x1), r1=78(y1), r2=162(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 78
LDI r2, 162
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
