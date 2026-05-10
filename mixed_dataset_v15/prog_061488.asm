; DESCRIPTION: Composite: Draws a blue circle centered at (430, 159) with radius 53 then Places a cyan dot at position (478, 48) then Places a purple 34x63 rectangle at position (34, 185).
; PLAN: r0=430(x), r1=159(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x), r6=48(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=34(x), r11=185(y), r12=34(width), r13=63(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 159
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 48
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 34
LDI r11, 185
LDI r12, 34
LDI r13, 63
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
