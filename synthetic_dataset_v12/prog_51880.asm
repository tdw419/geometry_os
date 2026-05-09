; DESCRIPTION: Composite: Places a purple dot at position (183, 247) then Draws a yellow rectangle at (232, 48) with width 73 and height 76 then Draws a cyan circle centered at (379, 178) with radius 64.
; PLAN: r0=183(x), r1=247(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=232(x), r6=48(y), r7=73(width), r8=76(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x), r11=178(y), r12=64(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 183
LDI r1, 247
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 232
LDI r6, 48
LDI r7, 73
LDI r8, 76
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 178
LDI r12, 64
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
