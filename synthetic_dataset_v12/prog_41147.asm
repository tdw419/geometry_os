; DESCRIPTION: Composite: Draws a cyan circle centered at (188, 29) with radius 29 then Draws a white rectangle at (355, 118) with width 98 and height 86.
; PLAN: r0=188(x), r1=29(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=118(y), r7=98(width), r8=86(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 29
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 118
LDI r7, 98
LDI r8, 86
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
