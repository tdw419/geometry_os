; DESCRIPTION: Composite: Draws a yellow rectangle at (101, 122) with width 95 and height 109 then Renders a orange disk with center (101, 160) and radius 76 then Sets a single purple pixel at (453, 9).
; PLAN: r0=101(x), r1=122(y), r2=95(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=160(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=453(x), r11=9(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 101
LDI r1, 122
LDI r2, 95
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 160
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 453
LDI r11, 9
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
