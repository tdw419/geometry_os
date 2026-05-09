; DESCRIPTION: Composite: Places a black circle of radius 64 at center (260, 92) then Places a blue dot at position (467, 242) then Draws a purple rectangle at (174, 138) with width 66 and height 85.
; PLAN: r0=260(x), r1=92(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=467(x), r6=242(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=174(x), r11=138(y), r12=66(width), r13=85(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 92
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 467
LDI r6, 242
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 174
LDI r11, 138
LDI r12, 66
LDI r13, 85
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
