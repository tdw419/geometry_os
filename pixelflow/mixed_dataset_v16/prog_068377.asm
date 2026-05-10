; DESCRIPTION: Composite: Places a blue 14x74 rectangle at position (343, 105) then Draws a blue circle centered at (485, 28) with radius 18.
; PLAN: r0=343(x), r1=105(y), r2=14(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x), r6=28(y), r7=18(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 343
LDI r1, 105
LDI r2, 14
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 28
LDI r7, 18
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
