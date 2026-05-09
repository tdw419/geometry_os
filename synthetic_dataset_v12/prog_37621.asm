; DESCRIPTION: Composite: Draws a blue rectangle at (229, 78) with width 73 and height 109 then Creates a white circular shape at (104, 145) with radius 10.
; PLAN: r0=229(x), r1=78(y), r2=73(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=145(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 229
LDI r1, 78
LDI r2, 73
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 145
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
