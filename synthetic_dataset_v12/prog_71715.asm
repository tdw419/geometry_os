; DESCRIPTION: Composite: Renders a orange disk with center (343, 186) and radius 56 then Draws a purple rectangle at (434, 1) with width 15 and height 67 then Sets a single red pixel at (320, 229).
; PLAN: r0=343(x), r1=186(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x), r6=1(y), r7=15(width), r8=67(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x), r11=229(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 186
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 1
LDI r7, 15
LDI r8, 67
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 229
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
