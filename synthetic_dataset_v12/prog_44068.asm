; DESCRIPTION: Places a green line segment connecting (300, 207) to (72, 88).
; PLAN: r0=300(x1), r1=207(y1), r2=72(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 207
LDI r2, 72
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
