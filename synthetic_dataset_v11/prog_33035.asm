; DESCRIPTION: Places a green line segment connecting (185, 14) to (101, 29).
; PLAN: r0=185(x1), r1=14(y1), r2=101(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 14
LDI r2, 101
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
