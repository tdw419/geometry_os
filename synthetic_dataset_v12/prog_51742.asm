; DESCRIPTION: Composite: Places a purple 29x118 rectangle at position (341, 104) then Renders a orange disk with center (421, 43) and radius 26.
; PLAN: r0=341(x), r1=104(y), r2=29(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=43(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 104
LDI r2, 29
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 43
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
