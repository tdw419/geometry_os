; DESCRIPTION: Places a green line segment connecting (303, 162) to (209, 158).
; PLAN: r0=303(x1), r1=162(y1), r2=209(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 162
LDI r2, 209
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
