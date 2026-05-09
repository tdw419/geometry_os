; DESCRIPTION: Composite: Renders a magenta disk with center (333, 66) and radius 60 then Draws a black rectangle at (139, 80) with width 13 and height 108 then Sets a single purple pixel at (481, 170).
; PLAN: r0=333(x), r1=66(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=80(y), r7=13(width), r8=108(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=481(x), r11=170(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 333
LDI r1, 66
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 80
LDI r7, 13
LDI r8, 108
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 481
LDI r11, 170
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
