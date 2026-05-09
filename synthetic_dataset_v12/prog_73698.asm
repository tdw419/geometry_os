; DESCRIPTION: Composite: Renders a white disk with center (321, 201) and radius 42 then Creates a blue rectangular region at (134, 109) spanning 114 by 119 pixels then Sets a single red pixel at (491, 81).
; PLAN: r0=321(x), r1=201(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=109(y), r7=114(width), r8=119(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=491(x), r11=81(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 321
LDI r1, 201
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 109
LDI r7, 114
LDI r8, 119
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 491
LDI r11, 81
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
