; DESCRIPTION: Places a yellow line segment connecting (54, 53) to (88, 197).
; PLAN: r0=54(x1), r1=53(y1), r2=88(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 53
LDI r2, 88
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
