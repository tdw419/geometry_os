; DESCRIPTION: Composite: Draws a red rectangle at (388, 128) with width 75 and height 105 then Places a red dot at position (44, 62) then Places a green circle of radius 32 at center (141, 58).
; PLAN: r0=388(x), r1=128(y), r2=75(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x), r6=62(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=141(x), r11=58(y), r12=32(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 388
LDI r1, 128
LDI r2, 75
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 62
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 141
LDI r11, 58
LDI r12, 32
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
