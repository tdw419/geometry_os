; DESCRIPTION: Composite: Renders a red disk with center (381, 52) and radius 24 then Draws a green rectangle at (381, 36) with width 38 and height 29.
; PLAN: r0=381(x), r1=52(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x), r6=36(y), r7=38(width), r8=29(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 52
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 36
LDI r7, 38
LDI r8, 29
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
