; DESCRIPTION: Composite: Places a green circle of radius 52 at center (351, 76) then Draws a white rectangle at (358, 112) with width 83 and height 89.
; PLAN: r0=351(x), r1=76(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=112(y), r7=83(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 76
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 112
LDI r7, 83
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
