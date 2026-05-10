; DESCRIPTION: Composite: Draws a white rectangle at (58, 123) with width 11 and height 75 then Sets a single purple pixel at (434, 189) then Renders a orange disk with center (321, 101) and radius 73.
; PLAN: r0=58(x), r1=123(y), r2=11(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=189(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=321(x), r11=101(y), r12=73(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 123
LDI r2, 11
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 189
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 321
LDI r11, 101
LDI r12, 73
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
