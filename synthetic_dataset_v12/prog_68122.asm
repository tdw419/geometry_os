; DESCRIPTION: Composite: Creates a yellow rectangular region at (349, 133) spanning 101 by 108 pixels then Places a orange dot at position (418, 68) then Places a green circle of radius 18 at center (447, 28).
; PLAN: r0=349(x), r1=133(y), r2=101(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=68(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=447(x), r11=28(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 349
LDI r1, 133
LDI r2, 101
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 68
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 447
LDI r11, 28
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
