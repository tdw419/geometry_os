; DESCRIPTION: Places a green line segment connecting (162, 211) to (146, 74).
; PLAN: r0=162(x1), r1=211(y1), r2=146(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 211
LDI r2, 146
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
