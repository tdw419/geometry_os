; DESCRIPTION: Composite: Creates a blue rectangular region at (282, 58) spanning 109 by 111 pixels then Sets a single orange pixel at (258, 117) then Places a green circle of radius 16 at center (232, 145).
; PLAN: r0=282(x), r1=58(y), r2=109(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=117(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=232(x), r11=145(y), r12=16(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 282
LDI r1, 58
LDI r2, 109
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 117
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 232
LDI r11, 145
LDI r12, 16
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
