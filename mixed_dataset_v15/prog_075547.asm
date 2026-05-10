; DESCRIPTION: Composite: Creates a green circular shape at (233, 108) with radius 20 then Draws a purple rectangle at (23, 92) with width 45 and height 25.
; PLAN: r0=233(x), r1=108(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x), r6=92(y), r7=45(width), r8=25(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 108
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 92
LDI r7, 45
LDI r8, 25
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
