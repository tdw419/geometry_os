; DESCRIPTION: Composite: Draws a black circle centered at (357, 179) with radius 75 then Draws a white rectangle at (260, 61) with width 78 and height 44.
; PLAN: r0=357(x), r1=179(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=61(y), r7=78(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 179
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 61
LDI r7, 78
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
