; DESCRIPTION: Composite: Places a yellow circle of radius 56 at center (370, 151) then Places a white dot at position (315, 62) then Creates a blue rectangular region at (231, 197) spanning 101 by 26 pixels.
; PLAN: r0=370(x), r1=151(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x), r6=62(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=231(x), r11=197(y), r12=101(width), r13=26(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 151
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 62
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 231
LDI r11, 197
LDI r12, 101
LDI r13, 26
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
