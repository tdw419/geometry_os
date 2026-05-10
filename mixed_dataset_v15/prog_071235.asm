; DESCRIPTION: Places a blue line segment connecting (162, 245) to (207, 121).
; PLAN: r0=162(x1), r1=245(y1), r2=207(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 245
LDI r2, 207
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
