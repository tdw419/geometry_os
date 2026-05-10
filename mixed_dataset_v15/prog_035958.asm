; DESCRIPTION: Composite: Renders a black disk with center (424, 187) and radius 54 then Draws a yellow rectangle at (184, 82) with width 28 and height 78.
; PLAN: r0=424(x), r1=187(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=82(y), r7=28(width), r8=78(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 187
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 82
LDI r7, 28
LDI r8, 78
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
