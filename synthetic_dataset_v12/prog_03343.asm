; DESCRIPTION: Composite: Renders a cyan disk with center (273, 167) and radius 10 then Draws a white rectangle at (318, 78) with width 47 and height 41.
; PLAN: r0=273(x), r1=167(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x), r6=78(y), r7=47(width), r8=41(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 167
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 78
LDI r7, 47
LDI r8, 41
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
