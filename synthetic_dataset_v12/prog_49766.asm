; DESCRIPTION: Composite: Draws a magenta rectangle at (16, 10) with width 14 and height 66 then Renders a orange disk with center (287, 132) and radius 45 then Sets a single white pixel at (427, 192).
; PLAN: r0=16(x), r1=10(y), r2=14(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=132(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=427(x), r11=192(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 16
LDI r1, 10
LDI r2, 14
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 132
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 427
LDI r11, 192
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
