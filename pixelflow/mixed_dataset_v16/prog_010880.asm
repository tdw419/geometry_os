; DESCRIPTION: Places a green line segment connecting (318, 30) to (162, 214).
; PLAN: r0=318(x1), r1=30(y1), r2=162(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 30
LDI r2, 162
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
