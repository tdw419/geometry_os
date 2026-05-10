; DESCRIPTION: Composite: Places a orange 100x44 rectangle at position (217, 108) then Sets a single cyan pixel at (235, 163) then Draws a purple circle centered at (261, 133) with radius 49.
; PLAN: r0=217(x), r1=108(y), r2=100(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=163(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=261(x), r11=133(y), r12=49(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 217
LDI r1, 108
LDI r2, 100
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 163
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 261
LDI r11, 133
LDI r12, 49
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
