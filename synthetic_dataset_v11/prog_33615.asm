; DESCRIPTION: Places a green line segment connecting (24, 68) to (22, 5).
; PLAN: r0=24(x1), r1=68(y1), r2=22(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 68
LDI r2, 22
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
