; DESCRIPTION: Composite: Places a purple dot at position (0, 18) then Creates a black rectangular region at (159, 135) spanning 12 by 68 pixels then Draws a red circle centered at (455, 195) with radius 48.
; PLAN: r0=0(x), r1=18(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=135(y), r7=12(width), r8=68(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=455(x), r11=195(y), r12=48(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 18
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 159
LDI r6, 135
LDI r7, 12
LDI r8, 68
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 195
LDI r12, 48
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
