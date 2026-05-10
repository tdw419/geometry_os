; DESCRIPTION: Composite: Draws a green rectangle at (26, 24) with width 104 and height 81 then Places a yellow dot at position (157, 246).
; PLAN: r0=26(x), r1=24(y), r2=104(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=246(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 26
LDI r1, 24
LDI r2, 104
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 246
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
