; DESCRIPTION: Composite: Draws a cyan rectangle at (183, 110) with width 115 and height 95 then Renders a magenta disk with center (352, 159) and radius 52.
; PLAN: r0=183(x), r1=110(y), r2=115(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=159(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 110
LDI r2, 115
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 159
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
