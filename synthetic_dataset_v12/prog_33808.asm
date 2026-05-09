; DESCRIPTION: Composite: Draws a blue rectangle at (132, 143) with width 93 and height 81 then Draws a orange circle centered at (85, 89) with radius 75.
; PLAN: r0=132(x), r1=143(y), r2=93(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=89(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 143
LDI r2, 93
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 89
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
