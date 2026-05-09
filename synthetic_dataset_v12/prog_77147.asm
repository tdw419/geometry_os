; DESCRIPTION: Composite: Draws a blue circle centered at (94, 173) with radius 61 then Places a white dot at position (435, 216) then Draws a black rectangle at (77, 96) with width 71 and height 20.
; PLAN: r0=94(x), r1=173(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=216(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=77(x), r11=96(y), r12=71(width), r13=20(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 173
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 216
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 77
LDI r11, 96
LDI r12, 71
LDI r13, 20
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
