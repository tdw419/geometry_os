; DESCRIPTION: Composite: Places a orange circle of radius 49 at center (64, 98) then Draws a red rectangle at (384, 94) with width 41 and height 64.
; PLAN: r0=64(x), r1=98(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=94(y), r7=41(width), r8=64(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 98
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 94
LDI r7, 41
LDI r8, 64
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
