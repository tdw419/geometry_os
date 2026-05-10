; DESCRIPTION: Composite: Creates a blue circular shape at (155, 94) with radius 13 then Creates a blue rectangular region at (89, 132) spanning 29 by 98 pixels.
; PLAN: r0=155(x), r1=94(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x), r6=132(y), r7=29(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 94
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 132
LDI r7, 29
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
