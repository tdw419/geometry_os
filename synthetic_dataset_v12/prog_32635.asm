; DESCRIPTION: Composite: Draws a green rectangle at (388, 11) with width 61 and height 38 then Places a black circle of radius 19 at center (424, 31).
; PLAN: r0=388(x), r1=11(y), r2=61(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=31(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 388
LDI r1, 11
LDI r2, 61
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 31
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
