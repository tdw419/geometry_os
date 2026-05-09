; DESCRIPTION: Composite: Places a blue line segment connecting (492, 181) to (505, 128) then Creates a white circular shape at (122, 161) with radius 40.
; PLAN: r0=492(x1), r1=181(y1), r2=505(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=161(y), r7=40(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 492
LDI r1, 181
LDI r2, 505
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 161
LDI r7, 40
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
