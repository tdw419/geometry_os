; DESCRIPTION: Composite: Creates a white rectangular region at (97, 94) spanning 113 by 89 pixels then Draws a green circle centered at (297, 176) with radius 59.
; PLAN: r0=97(x), r1=94(y), r2=113(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=176(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 94
LDI r2, 113
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 176
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
