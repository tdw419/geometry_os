; DESCRIPTION: Composite: Places a white 19x94 rectangle at position (324, 48) then Draws a yellow circle centered at (152, 81) with radius 69.
; PLAN: r0=324(x), r1=48(y), r2=19(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=81(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 324
LDI r1, 48
LDI r2, 19
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 81
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
