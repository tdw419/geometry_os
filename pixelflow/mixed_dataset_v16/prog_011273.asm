; DESCRIPTION: Composite: Draws a red circle centered at (429, 144) with radius 37 then Places a magenta 49x17 rectangle at position (84, 91) then Sets a single magenta pixel at (440, 172).
; PLAN: r0=429(x), r1=144(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=84(x), r6=91(y), r7=49(width), r8=17(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=440(x), r11=172(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 429
LDI r1, 144
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 84
LDI r6, 91
LDI r7, 49
LDI r8, 17
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 172
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
