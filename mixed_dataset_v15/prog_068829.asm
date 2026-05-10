; DESCRIPTION: Composite: Draws a green circle centered at (303, 132) with radius 36 then Places a yellow 81x107 rectangle at position (265, 68).
; PLAN: r0=303(x), r1=132(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=68(y), r7=81(width), r8=107(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 132
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 68
LDI r7, 81
LDI r8, 107
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
