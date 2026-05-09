; DESCRIPTION: Composite: Places a black dot at position (108, 158) then Places a yellow 111x118 rectangle at position (152, 116) then Draws a yellow circle centered at (376, 194) with radius 43.
; PLAN: r0=108(x), r1=158(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=116(y), r7=111(width), r8=118(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=376(x), r11=194(y), r12=43(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 158
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 152
LDI r6, 116
LDI r7, 111
LDI r8, 118
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 194
LDI r12, 43
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
