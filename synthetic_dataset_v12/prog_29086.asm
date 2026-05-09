; DESCRIPTION: Composite: Draws a green circle centered at (170, 143) with radius 74 then Places a black 28x106 rectangle at position (436, 89).
; PLAN: r0=170(x), r1=143(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=89(y), r7=28(width), r8=106(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 143
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 89
LDI r7, 28
LDI r8, 106
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
