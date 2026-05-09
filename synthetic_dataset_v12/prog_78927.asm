; DESCRIPTION: Composite: Places a magenta dot at position (476, 47) then Draws a red rectangle at (403, 86) with width 28 and height 40 then Draws a purple circle centered at (376, 138) with radius 50.
; PLAN: r0=476(x), r1=47(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=403(x), r6=86(y), r7=28(width), r8=40(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=376(x), r11=138(y), r12=50(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 476
LDI r1, 47
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 403
LDI r6, 86
LDI r7, 28
LDI r8, 40
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 138
LDI r12, 50
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
