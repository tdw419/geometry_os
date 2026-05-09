; DESCRIPTION: Composite: Places a white line segment connecting (318, 136) to (496, 131) then Creates a yellow rectangular region at (18, 130) spanning 88 by 74 pixels then Places a yellow dot at position (255, 254).
; PLAN: r0=318(x1), r1=136(y1), r2=496(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=130(y), r7=88(width), r8=74(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x), r11=254(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 318
LDI r1, 136
LDI r2, 496
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 130
LDI r7, 88
LDI r8, 74
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 254
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
