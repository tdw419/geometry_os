; DESCRIPTION: Composite: Draws a magenta line from (407, 175) to (436, 37) then Places a blue dot at position (261, 32) then Creates a blue rectangular region at (261, 62) spanning 84 by 44 pixels.
; PLAN: r0=407(x1), r1=175(y1), r2=436(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=32(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=261(x), r11=62(y), r12=84(width), r13=44(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 175
LDI r2, 436
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 32
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 261
LDI r11, 62
LDI r12, 84
LDI r13, 44
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
