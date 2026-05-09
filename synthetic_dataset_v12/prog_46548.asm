; DESCRIPTION: Composite: Renders a black line between points (388, 155) and (215, 83) then Places a red dot at position (372, 49) then Draws a purple rectangle at (59, 22) with width 31 and height 118.
; PLAN: r0=388(x1), r1=155(y1), r2=215(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=49(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=59(x), r11=22(y), r12=31(width), r13=118(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 155
LDI r2, 215
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 49
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 59
LDI r11, 22
LDI r12, 31
LDI r13, 118
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
