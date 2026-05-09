; DESCRIPTION: Places a black line segment connecting (175, 22) to (290, 254).
; PLAN: r0=175(x1), r1=22(y1), r2=290(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 22
LDI r2, 290
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
