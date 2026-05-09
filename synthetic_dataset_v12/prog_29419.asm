; DESCRIPTION: Composite: Places a blue 37x83 rectangle at position (52, 133) then Draws a blue circle centered at (315, 87) with radius 62.
; PLAN: r0=52(x), r1=133(y), r2=37(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=87(y), r7=62(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 52
LDI r1, 133
LDI r2, 37
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 87
LDI r7, 62
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
