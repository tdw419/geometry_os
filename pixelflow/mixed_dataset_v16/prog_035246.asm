; DESCRIPTION: Composite: Renders a blue disk with center (105, 220) and radius 19 then Draws a black rectangle at (342, 80) with width 31 and height 45 then Sets a single purple pixel at (128, 126).
; PLAN: r0=105(x), r1=220(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=80(y), r7=31(width), r8=45(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=128(x), r11=126(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 220
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 80
LDI r7, 31
LDI r8, 45
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 126
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
