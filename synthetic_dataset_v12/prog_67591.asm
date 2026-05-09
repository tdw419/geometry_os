; DESCRIPTION: Composite: Draws a blue rectangle at (329, 64) with width 18 and height 41 then Creates a orange circular shape at (230, 153) with radius 71.
; PLAN: r0=329(x), r1=64(y), r2=18(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=153(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 64
LDI r2, 18
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 153
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
