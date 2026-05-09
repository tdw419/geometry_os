; DESCRIPTION: Composite: Places a cyan dot at position (355, 181) then Draws a magenta circle centered at (311, 173) with radius 67 then Draws a white rectangle at (256, 18) with width 70 and height 101.
; PLAN: r0=355(x), r1=181(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=173(y), r7=67(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x), r11=18(y), r12=70(width), r13=101(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 181
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 311
LDI r6, 173
LDI r7, 67
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 18
LDI r12, 70
LDI r13, 101
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
