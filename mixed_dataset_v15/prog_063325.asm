; DESCRIPTION: Composite: Renders a red disk with center (107, 186) and radius 47 then Draws a green rectangle at (15, 89) with width 90 and height 116.
; PLAN: r0=107(x), r1=186(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=89(y), r7=90(width), r8=116(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 186
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 89
LDI r7, 90
LDI r8, 116
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
