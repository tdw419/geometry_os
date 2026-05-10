; DESCRIPTION: Composite: Renders a cyan disk with center (452, 161) and radius 48 then Draws a orange rectangle at (56, 172) with width 114 and height 57 then Sets a single blue pixel at (253, 101).
; PLAN: r0=452(x), r1=161(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=172(y), r7=114(width), r8=57(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x), r11=101(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 452
LDI r1, 161
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 172
LDI r7, 114
LDI r8, 57
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 101
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
