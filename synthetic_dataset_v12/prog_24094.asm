; DESCRIPTION: Composite: Draws a green rectangle at (66, 38) with width 94 and height 22 then Places a white circle of radius 28 at center (226, 140).
; PLAN: r0=66(x), r1=38(y), r2=94(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=140(y), r7=28(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 66
LDI r1, 38
LDI r2, 94
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 140
LDI r7, 28
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
