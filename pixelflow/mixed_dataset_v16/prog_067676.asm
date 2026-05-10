; DESCRIPTION: Composite: Places a orange 114x88 rectangle at position (230, 124) then Draws a orange circle centered at (84, 191) with radius 50.
; PLAN: r0=230(x), r1=124(y), r2=114(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=191(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 230
LDI r1, 124
LDI r2, 114
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 191
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
