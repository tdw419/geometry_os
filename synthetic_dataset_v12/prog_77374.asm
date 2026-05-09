; DESCRIPTION: Composite: Creates a black rectangular region at (405, 2) spanning 36 by 35 pixels then Sets a single black pixel at (127, 232) then Draws a green circle centered at (78, 88) with radius 51.
; PLAN: r0=405(x), r1=2(y), r2=36(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=232(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=78(x), r11=88(y), r12=51(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 405
LDI r1, 2
LDI r2, 36
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 232
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 78
LDI r11, 88
LDI r12, 51
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
