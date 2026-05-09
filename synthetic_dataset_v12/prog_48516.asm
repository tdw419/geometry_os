; DESCRIPTION: Composite: Renders a black disk with center (255, 82) and radius 36 then Draws a black rectangle at (57, 167) with width 60 and height 81 then Places a blue dot at position (56, 127).
; PLAN: r0=255(x), r1=82(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=167(y), r7=60(width), r8=81(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=56(x), r11=127(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 82
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 167
LDI r7, 60
LDI r8, 81
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 127
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
