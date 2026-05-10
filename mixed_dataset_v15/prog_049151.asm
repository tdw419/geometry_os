; DESCRIPTION: Composite: Creates a orange circular shape at (125, 113) with radius 61 then Draws a purple rectangle at (235, 32) with width 30 and height 52 then Sets a single yellow pixel at (350, 58).
; PLAN: r0=125(x), r1=113(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=32(y), r7=30(width), r8=52(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=350(x), r11=58(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 125
LDI r1, 113
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 32
LDI r7, 30
LDI r8, 52
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 58
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
