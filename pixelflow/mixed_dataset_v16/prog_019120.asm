; DESCRIPTION: Composite: Draws a orange circle centered at (80, 130) with radius 24 then Sets a single white pixel at (429, 198) then Draws a blue rectangle at (220, 66) with width 89 and height 24.
; PLAN: r0=80(x), r1=130(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x), r6=198(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=220(x), r11=66(y), r12=89(width), r13=24(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 130
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 198
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 66
LDI r12, 89
LDI r13, 24
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
