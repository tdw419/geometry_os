; DESCRIPTION: Composite: Places a white circle of radius 25 at center (211, 52) then Places a green dot at position (0, 209) then Draws a purple rectangle at (322, 61) with width 49 and height 68.
; PLAN: r0=211(x), r1=52(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=209(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=322(x), r11=61(y), r12=49(width), r13=68(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 52
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 209
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 322
LDI r11, 61
LDI r12, 49
LDI r13, 68
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
