; DESCRIPTION: Composite: Draws a purple rectangle at (131, 113) with width 14 and height 93 then Places a white dot at position (121, 130).
; PLAN: r0=131(x), r1=113(y), r2=14(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x), r6=130(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 131
LDI r1, 113
LDI r2, 14
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 130
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
