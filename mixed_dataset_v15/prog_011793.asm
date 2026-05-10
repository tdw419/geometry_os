; DESCRIPTION: Composite: Renders a magenta box of size 53x113 starting at (287, 103) then Sets a single black pixel at (8, 221) then Draws a blue circle centered at (140, 232) with radius 14.
; PLAN: r0=287(x), r1=103(y), r2=53(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=8(x), r6=221(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=140(x), r11=232(y), r12=14(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 103
LDI r2, 53
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 8
LDI r6, 221
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 140
LDI r11, 232
LDI r12, 14
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
