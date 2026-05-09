; DESCRIPTION: Composite: Places a yellow line segment connecting (189, 227) to (37, 95) then Creates a blue circular shape at (398, 175) with radius 13.
; PLAN: r0=189(x1), r1=227(y1), r2=37(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=175(y), r7=13(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 189
LDI r1, 227
LDI r2, 37
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 175
LDI r7, 13
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
