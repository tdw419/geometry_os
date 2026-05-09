; DESCRIPTION: Composite: Draws a cyan rectangle at (113, 169) with width 66 and height 18 then Renders a purple disk with center (184, 176) and radius 72.
; PLAN: r0=113(x), r1=169(y), r2=66(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=176(y), r7=72(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 113
LDI r1, 169
LDI r2, 66
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 176
LDI r7, 72
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
