; DESCRIPTION: Composite: Draws a blue rectangle at (328, 49) with width 94 and height 60 then Renders a black disk with center (388, 173) and radius 10 then Places a red dot at position (64, 106).
; PLAN: r0=328(x), r1=49(y), r2=94(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=173(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x), r11=106(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 328
LDI r1, 49
LDI r2, 94
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 173
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 106
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
