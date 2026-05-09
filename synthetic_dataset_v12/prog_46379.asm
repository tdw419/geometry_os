; DESCRIPTION: Composite: Renders a white box of size 107x28 starting at (13, 173) then Draws a blue circle centered at (151, 136) with radius 63.
; PLAN: r0=13(x), r1=173(y), r2=107(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=136(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 13
LDI r1, 173
LDI r2, 107
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 136
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
