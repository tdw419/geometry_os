; DESCRIPTION: Composite: Places a magenta dot at position (304, 78) then Renders a purple disk with center (390, 207) and radius 11 then Draws a black rectangle at (285, 14) with width 64 and height 107.
; PLAN: r0=304(x), r1=78(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=390(x), r6=207(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=285(x), r11=14(y), r12=64(width), r13=107(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 78
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 390
LDI r6, 207
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 285
LDI r11, 14
LDI r12, 64
LDI r13, 107
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
