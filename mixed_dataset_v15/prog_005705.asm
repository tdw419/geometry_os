; DESCRIPTION: Composite: Places a red dot at position (19, 156) then Renders a black box of size 90x76 starting at (207, 158) then Draws a magenta circle centered at (215, 201) with radius 19.
; PLAN: r0=19(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=158(y), r7=90(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=215(x), r11=201(y), r12=19(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 19
LDI r1, 156
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 207
LDI r6, 158
LDI r7, 90
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 201
LDI r12, 19
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
