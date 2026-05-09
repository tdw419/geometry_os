; DESCRIPTION: Composite: Renders a purple disk with center (285, 72) and radius 72 then Places a black dot at position (159, 116) then Draws a black rectangle at (338, 136) with width 115 and height 48.
; PLAN: r0=285(x), r1=72(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=116(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=338(x), r11=136(y), r12=115(width), r13=48(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 72
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 116
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 338
LDI r11, 136
LDI r12, 115
LDI r13, 48
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
