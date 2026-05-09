; DESCRIPTION: Composite: Draws a purple circle centered at (30, 186) with radius 29 then Sets a single cyan pixel at (53, 153) then Draws a black rectangle at (342, 60) with width 83 and height 94.
; PLAN: r0=30(x), r1=186(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=153(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=342(x), r11=60(y), r12=83(width), r13=94(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 186
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 153
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 342
LDI r11, 60
LDI r12, 83
LDI r13, 94
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
