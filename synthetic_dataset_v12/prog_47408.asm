; DESCRIPTION: Places a yellow line segment connecting (423, 175) to (442, 202).
; PLAN: r0=423(x1), r1=175(y1), r2=442(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 175
LDI r2, 442
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
