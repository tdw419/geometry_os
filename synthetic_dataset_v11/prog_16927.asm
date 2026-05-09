; DESCRIPTION: Places a yellow line segment connecting (21, 186) to (162, 200).
; PLAN: r0=21(x1), r1=186(y1), r2=162(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 186
LDI r2, 162
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
