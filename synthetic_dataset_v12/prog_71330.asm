; DESCRIPTION: Composite: Creates a blue rectangular region at (391, 115) spanning 86 by 119 pixels then Sets a single orange pixel at (491, 97) then Renders a yellow disk with center (316, 163) and radius 32.
; PLAN: r0=391(x), r1=115(y), r2=86(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=491(x), r6=97(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=316(x), r11=163(y), r12=32(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 115
LDI r2, 86
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 97
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 316
LDI r11, 163
LDI r12, 32
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
