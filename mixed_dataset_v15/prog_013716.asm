; DESCRIPTION: Composite: Renders a red disk with center (332, 94) and radius 78 then Draws a blue rectangle at (41, 128) with width 82 and height 104.
; PLAN: r0=332(x), r1=94(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=128(y), r7=82(width), r8=104(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 94
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 128
LDI r7, 82
LDI r8, 104
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
