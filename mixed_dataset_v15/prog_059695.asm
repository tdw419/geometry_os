; DESCRIPTION: Composite: Draws a green rectangle at (337, 233) with width 69 and height 20 then Places a black circle of radius 57 at center (309, 124).
; PLAN: r0=337(x), r1=233(y), r2=69(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=124(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 337
LDI r1, 233
LDI r2, 69
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 124
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
