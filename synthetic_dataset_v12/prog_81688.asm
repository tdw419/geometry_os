; DESCRIPTION: Composite: Draws a red rectangle at (280, 66) with width 62 and height 63 then Draws a magenta circle centered at (221, 97) with radius 28 then Places a yellow dot at position (105, 109).
; PLAN: r0=280(x), r1=66(y), r2=62(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=97(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=105(x), r11=109(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 280
LDI r1, 66
LDI r2, 62
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 97
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 105
LDI r11, 109
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
