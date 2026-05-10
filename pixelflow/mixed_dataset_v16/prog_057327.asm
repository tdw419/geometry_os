; DESCRIPTION: Composite: Draws a purple rectangle at (384, 70) with width 86 and height 110 then Creates a blue circular shape at (105, 132) with radius 73 then Places a white dot at position (16, 153).
; PLAN: r0=384(x), r1=70(y), r2=86(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=132(y), r7=73(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=16(x), r11=153(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 70
LDI r2, 86
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 132
LDI r7, 73
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 16
LDI r11, 153
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
