; DESCRIPTION: Composite: Draws a purple circle centered at (106, 82) with radius 66 then Draws a orange rectangle at (18, 221) with width 88 and height 26.
; PLAN: r0=106(x), r1=82(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x), r6=221(y), r7=88(width), r8=26(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 82
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 221
LDI r7, 88
LDI r8, 26
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
