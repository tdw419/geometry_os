; DESCRIPTION: Composite: Creates a white rectangular region at (250, 38) spanning 90 by 52 pixels then Draws a green circle centered at (140, 109) with radius 72 then Places a orange dot at position (326, 198).
; PLAN: r0=250(x), r1=38(y), r2=90(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=109(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=326(x), r11=198(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 250
LDI r1, 38
LDI r2, 90
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 109
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 326
LDI r11, 198
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
