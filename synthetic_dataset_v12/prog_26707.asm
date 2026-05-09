; DESCRIPTION: Composite: Places a green circle of radius 46 at center (132, 111) then Places a red dot at position (139, 16) then Draws a purple rectangle at (246, 141) with width 97 and height 26.
; PLAN: r0=132(x), r1=111(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=16(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=246(x), r11=141(y), r12=97(width), r13=26(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 111
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 16
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 246
LDI r11, 141
LDI r12, 97
LDI r13, 26
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
