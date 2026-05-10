; DESCRIPTION: Composite: Creates a black rectangular region at (86, 19) spanning 105 by 114 pixels then Renders a purple disk with center (296, 223) and radius 12.
; PLAN: r0=86(x), r1=19(y), r2=105(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=296(x), r6=223(y), r7=12(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 86
LDI r1, 19
LDI r2, 105
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 223
LDI r7, 12
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
