; DESCRIPTION: Composite: Renders a blue disk with center (145, 55) and radius 44 then Draws a white rectangle at (259, 165) with width 101 and height 52 then Sets a single cyan pixel at (5, 13).
; PLAN: r0=145(x), r1=55(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=165(y), r7=101(width), r8=52(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=5(x), r11=13(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 55
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 165
LDI r7, 101
LDI r8, 52
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 13
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
