; DESCRIPTION: Composite: Draws a blue circle centered at (376, 157) with radius 72 then Places a black 117x79 rectangle at position (209, 91) then Sets a single white pixel at (304, 19).
; PLAN: r0=376(x), r1=157(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x), r6=91(y), r7=117(width), r8=79(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x), r11=19(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 157
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 91
LDI r7, 117
LDI r8, 79
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 19
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
