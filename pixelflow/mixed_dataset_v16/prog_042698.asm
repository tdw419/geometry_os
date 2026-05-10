; DESCRIPTION: Composite: Draws a white rectangle at (354, 19) with width 107 and height 17 then Renders a red disk with center (80, 166) and radius 53.
; PLAN: r0=354(x), r1=19(y), r2=107(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x), r6=166(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 354
LDI r1, 19
LDI r2, 107
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 166
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
