; DESCRIPTION: Composite: Places a yellow circle of radius 12 at center (162, 147) then Sets a single green pixel at (187, 35) then Places a magenta 68x119 rectangle at position (170, 43).
; PLAN: r0=162(x), r1=147(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=35(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=170(x), r11=43(y), r12=68(width), r13=119(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 147
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 35
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 170
LDI r11, 43
LDI r12, 68
LDI r13, 119
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
