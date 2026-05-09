; DESCRIPTION: Composite: Draws a red circle centered at (449, 186) with radius 49 then Sets a single purple pixel at (498, 150) then Draws a blue rectangle at (315, 55) with width 101 and height 22.
; PLAN: r0=449(x), r1=186(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=150(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=315(x), r11=55(y), r12=101(width), r13=22(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 186
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 150
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 315
LDI r11, 55
LDI r12, 101
LDI r13, 22
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
