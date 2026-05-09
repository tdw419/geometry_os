; DESCRIPTION: Composite: Sets a single yellow pixel at (122, 178) then Creates a black circular shape at (482, 188) with radius 11 then Places a white line segment connecting (175, 90) to (100, 73).
; PLAN: r0=122(x), r1=178(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=482(x), r6=188(y), r7=11(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x1), r11=90(y1), r12=100(x2), r13=73(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 178
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 482
LDI r6, 188
LDI r7, 11
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 90
LDI r12, 100
LDI r13, 73
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
