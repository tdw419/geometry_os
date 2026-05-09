; DESCRIPTION: Places a green line segment connecting (206, 118) to (54, 162).
; PLAN: r0=206(x1), r1=118(y1), r2=54(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 118
LDI r2, 54
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
