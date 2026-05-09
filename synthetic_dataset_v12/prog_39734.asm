; DESCRIPTION: Composite: Renders a purple box of size 69x108 starting at (312, 75) then Places a white dot at position (170, 43) then Renders a purple disk with center (90, 104) and radius 29.
; PLAN: r0=312(x), r1=75(y), r2=69(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=43(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=90(x), r11=104(y), r12=29(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 312
LDI r1, 75
LDI r2, 69
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 43
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 90
LDI r11, 104
LDI r12, 29
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
