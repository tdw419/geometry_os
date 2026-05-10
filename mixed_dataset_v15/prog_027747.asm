; DESCRIPTION: Composite: Creates a black rectangular region at (332, 88) spanning 23 by 104 pixels then Renders a green disk with center (51, 122) and radius 23 then Places a blue dot at position (12, 105).
; PLAN: r0=332(x), r1=88(y), r2=23(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x), r6=122(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=12(x), r11=105(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 332
LDI r1, 88
LDI r2, 23
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 122
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 12
LDI r11, 105
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
