; DESCRIPTION: Composite: Draws a green rectangle at (209, 147) with width 79 and height 56 then Renders a magenta disk with center (64, 94) and radius 47 then Places a green dot at position (8, 195).
; PLAN: r0=209(x), r1=147(y), r2=79(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x), r6=94(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x), r11=195(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 209
LDI r1, 147
LDI r2, 79
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 94
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 195
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
