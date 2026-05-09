; DESCRIPTION: Composite: Renders a red disk with center (116, 189) and radius 41 then Draws a white rectangle at (411, 167) with width 73 and height 35.
; PLAN: r0=116(x), r1=189(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=167(y), r7=73(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 189
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 167
LDI r7, 73
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
