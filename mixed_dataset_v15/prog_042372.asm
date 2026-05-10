; DESCRIPTION: Composite: Places a black circle of radius 23 at center (218, 138) then Draws a purple rectangle at (229, 76) with width 105 and height 22.
; PLAN: r0=218(x), r1=138(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=76(y), r7=105(width), r8=22(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 138
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 76
LDI r7, 105
LDI r8, 22
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
