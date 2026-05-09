; DESCRIPTION: Composite: Draws a blue rectangle at (215, 227) with width 73 and height 19 then Draws a white circle centered at (280, 81) with radius 78.
; PLAN: r0=215(x), r1=227(y), r2=73(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=81(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 227
LDI r2, 73
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 81
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
