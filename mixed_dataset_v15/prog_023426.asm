; DESCRIPTION: Composite: Draws a black circle centered at (131, 106) with radius 49 then Sets a single magenta pixel at (305, 176) then Draws a magenta rectangle at (314, 95) with width 42 and height 115.
; PLAN: r0=131(x), r1=106(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=176(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=314(x), r11=95(y), r12=42(width), r13=115(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 106
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 176
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 314
LDI r11, 95
LDI r12, 42
LDI r13, 115
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
