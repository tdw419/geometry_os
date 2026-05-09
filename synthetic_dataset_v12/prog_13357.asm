; DESCRIPTION: Composite: Draws a green rectangle at (64, 21) with width 101 and height 19 then Places a yellow line segment connecting (381, 162) to (330, 130) then Sets a single orange pixel at (164, 71).
; PLAN: r0=64(x), r1=21(y), r2=101(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x1), r6=162(y1), r7=330(x2), r8=130(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=164(x), r11=71(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 21
LDI r2, 101
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 162
LDI r7, 330
LDI r8, 130
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 71
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
