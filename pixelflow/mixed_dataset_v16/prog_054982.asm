; DESCRIPTION: Composite: Draws a black rectangle at (148, 27) with width 65 and height 118 then Places a black circle of radius 52 at center (204, 114).
; PLAN: r0=148(x), r1=27(y), r2=65(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=114(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 148
LDI r1, 27
LDI r2, 65
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 114
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
