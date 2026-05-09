; DESCRIPTION: Places a yellow line segment connecting (34, 122) to (213, 25).
; PLAN: r0=34(x1), r1=122(y1), r2=213(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 122
LDI r2, 213
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
