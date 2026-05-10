; DESCRIPTION: Composite: Draws a green rectangle at (133, 119) with width 77 and height 42 then Draws a yellow circle centered at (272, 83) with radius 56.
; PLAN: r0=133(x), r1=119(y), r2=77(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=83(y), r7=56(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 119
LDI r2, 77
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 83
LDI r7, 56
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
