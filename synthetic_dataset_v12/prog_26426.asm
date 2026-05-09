; DESCRIPTION: Composite: Places a blue circle of radius 19 at center (251, 197) then Places a blue dot at position (447, 72) then Creates a black rectangular region at (238, 123) spanning 45 by 102 pixels.
; PLAN: r0=251(x), r1=197(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x), r6=72(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=238(x), r11=123(y), r12=45(width), r13=102(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 197
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 72
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 238
LDI r11, 123
LDI r12, 45
LDI r13, 102
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
