; DESCRIPTION: Composite: Draws a red rectangle at (271, 64) with width 64 and height 37 then Places a magenta circle of radius 28 at center (427, 123) then Sets a single green pixel at (259, 114).
; PLAN: r0=271(x), r1=64(y), r2=64(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x), r6=123(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=259(x), r11=114(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 271
LDI r1, 64
LDI r2, 64
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 123
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 259
LDI r11, 114
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
