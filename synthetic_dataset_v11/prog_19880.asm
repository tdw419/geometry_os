; DESCRIPTION: Places a blue line segment connecting (101, 175) to (107, 10).
; PLAN: r0=101(x1), r1=175(y1), r2=107(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 175
LDI r2, 107
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
