; DESCRIPTION: Composite: Places a magenta circle of radius 40 at center (173, 172) then Draws a orange rectangle at (329, 42) with width 92 and height 43.
; PLAN: r0=173(x), r1=172(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=42(y), r7=92(width), r8=43(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 172
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 42
LDI r7, 92
LDI r8, 43
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
