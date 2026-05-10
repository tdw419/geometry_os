; DESCRIPTION: Composite: Places a black circle of radius 16 at center (418, 136) then Sets a single magenta pixel at (291, 167) then Draws a purple rectangle at (481, 131) with width 15 and height 98.
; PLAN: r0=418(x), r1=136(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=167(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=481(x), r11=131(y), r12=15(width), r13=98(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 136
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 167
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 481
LDI r11, 131
LDI r12, 15
LDI r13, 98
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
