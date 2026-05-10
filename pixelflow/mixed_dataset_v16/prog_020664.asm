; DESCRIPTION: Composite: Draws a green circle centered at (128, 188) with radius 56 then Places a purple dot at position (466, 22) then Creates a blue rectangular region at (318, 186) spanning 107 by 55 pixels.
; PLAN: r0=128(x), r1=188(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=22(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=318(x), r11=186(y), r12=107(width), r13=55(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 188
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 22
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 318
LDI r11, 186
LDI r12, 107
LDI r13, 55
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
