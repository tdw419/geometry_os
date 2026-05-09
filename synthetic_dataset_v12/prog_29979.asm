; DESCRIPTION: Composite: Places a green dot at position (436, 175) then Places a black circle of radius 78 at center (154, 153) then Places a black line segment connecting (338, 119) to (3, 21).
; PLAN: r0=436(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=154(x), r6=153(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x1), r11=119(y1), r12=3(x2), r13=21(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 175
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 154
LDI r6, 153
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 119
LDI r12, 3
LDI r13, 21
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
