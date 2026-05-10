; DESCRIPTION: Composite: Places a blue line segment connecting (215, 241) to (149, 123) then Creates a white circular shape at (395, 211) with radius 14.
; PLAN: r0=215(x1), r1=241(y1), r2=149(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=211(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 241
LDI r2, 149
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 211
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
