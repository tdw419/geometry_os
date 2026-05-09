; DESCRIPTION: Composite: Draws a yellow rectangle at (150, 111) with width 90 and height 38 then Creates a orange circular shape at (191, 92) with radius 74 then Sets a single red pixel at (353, 37).
; PLAN: r0=150(x), r1=111(y), r2=90(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=92(y), r7=74(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=353(x), r11=37(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 150
LDI r1, 111
LDI r2, 90
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 92
LDI r7, 74
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 353
LDI r11, 37
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
