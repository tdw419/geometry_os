; DESCRIPTION: Composite: Draws a black circle centered at (205, 104) with radius 22 then Places a green dot at position (122, 160) then Creates a magenta rectangular region at (418, 150) spanning 79 by 25 pixels.
; PLAN: r0=205(x), r1=104(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=160(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=418(x), r11=150(y), r12=79(width), r13=25(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 104
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 160
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 418
LDI r11, 150
LDI r12, 79
LDI r13, 25
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
