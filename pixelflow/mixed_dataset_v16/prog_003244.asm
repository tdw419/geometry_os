; DESCRIPTION: Composite: Renders a white disk with center (219, 101) and radius 56 then Draws a orange rectangle at (63, 93) with width 66 and height 115.
; PLAN: r0=219(x), r1=101(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=93(y), r7=66(width), r8=115(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 101
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 93
LDI r7, 66
LDI r8, 115
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
