; DESCRIPTION: Places a yellow line segment connecting (40, 175) to (386, 230).
; PLAN: r0=40(x1), r1=175(y1), r2=386(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 175
LDI r2, 386
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
